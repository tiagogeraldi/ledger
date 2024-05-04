class Person < ApplicationRecord
  belongs_to :user, optional: true

  has_many :debts, dependent: :destroy
  has_many :payments, dependent: :destroy

  validates :name, :national_id, presence: true
  validates :national_id, uniqueness: true
  validate :cpf_or_cnpj

  def update_balance
    update! balance: total_payments - total_debts
  end

  def total_payments
    total = 0
    payments.each do |payment|
      total += payment.amount
    end

    total
  end

  def total_debts
    total = 0
    debts.each do |debt|
      total += debt.amount
    end

    total
  end

  private

  def cpf_or_cnpj
    if !CPF.valid?(national_id) && !CNPJ.valid?(national_id)
      errors.add :national_id, :invalid
    end
  end
end
