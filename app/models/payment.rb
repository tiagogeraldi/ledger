class Payment < ApplicationRecord
  belongs_to :person

  after_save :update_person_balance

  def update_person_balance
    person.update_balance
  end
end
