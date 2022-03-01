# frozen_string_literal: true

class RemoveUserFromReceiverAccount < ActiveRecord::Migration[7.0]
  def change
    remove_column :receiver_accounts, :user_id, :string
  end
end
