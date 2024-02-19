class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone_number
      t.string :national_id
      t.boolean :active

      t.timestamps
    end
  end
end
