class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :person, null: false, foreign_key: true
      t.float :amount
      t.date :paid_at

      t.timestamps
    end
  end
end
