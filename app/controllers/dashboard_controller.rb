class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @active_people_pie_chart = {
      active: Person.where(active: true).count,
      inactive: Person.where(active: false).count
    }

    active_people_ids = Person.where(active: true).select(:id)

    @total_debts = Debt.where(person_id: active_people_ids).sum(:amount)

    @total_payments = Payment.where(person_id: active_people_ids).sum(:amount)

    @balance = @total_payments - @total_debts

    @last_debts = Debt.order(created_at: :desc).limit(10).map do |debt|
      [debt.id, debt.amount]
    end

    @last_payments = Payment.order(created_at: :desc).limit(10).map do |payment|
      [payment.id, payment.amount]
    end

    @my_people = Person.where(user: current_user).order(:created_at).limit(10)

    @top_person = Person.order(:balance).last

    @bottom_person = Person.order(:balance).first
  end
end
