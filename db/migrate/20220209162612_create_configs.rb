# frozen_string_literal: true

class CreateConfigs < ActiveRecord::Migration[7.0]
  def change
    create_table :configs do |t|
      t.integer :round_up_to
      t.boolean :percentage
      t.integer :round_up_cap

      t.timestamps
    end
  end
end
