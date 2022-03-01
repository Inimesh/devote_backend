# frozen_string_literal: true

class AddUserToReceiverAccount < ActiveRecord::Migration[7.0]
  def change
    add_reference :receiver_accounts, :user, null: false, foreign_key: true
  end
end
