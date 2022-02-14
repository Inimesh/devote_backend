class AddFieldsToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :user, null: false, foreign_key: true
    add_column :transactions, :name, :string
  end
end
