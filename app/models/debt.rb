class Debt < ApplicationRecord
  belongs_to :person

  validates :amount, presence: true

  after_save :update_person_balance

  def update_person_balance
    person.update_balance
  end
end
