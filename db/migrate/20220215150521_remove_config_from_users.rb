class RemoveConfigFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :users, :config, null: false, foreign_key: true
  end
end
