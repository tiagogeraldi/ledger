class AddBalanceToPeople < ActiveRecord::Migration[7.1]
  def change
    add_column :people, :balance, :float, default: 0
  end
end
