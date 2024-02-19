class AddUserToPeople < ActiveRecord::Migration[7.1]
  def change
    add_reference :people, :user, null: true, foreign_key: true, index: true
  end
end
