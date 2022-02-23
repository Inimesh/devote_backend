# frozen_string_literal: true

class AddConfigToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :config, null: true, foreign_key: true
  end
end
