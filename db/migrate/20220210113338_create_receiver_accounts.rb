class CreateReceiverAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :receiver_accounts do |t|
      t.string :account_name
      t.integer :account_no
      t.integer :sort_code
      t.integer :user_id

      t.timestamps
    end
  end
end
