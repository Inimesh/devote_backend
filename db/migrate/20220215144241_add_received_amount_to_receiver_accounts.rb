# frozen_string_literal: true

class AddReceivedAmountToReceiverAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :receiver_accounts, :received_amount, :float
  end
end
