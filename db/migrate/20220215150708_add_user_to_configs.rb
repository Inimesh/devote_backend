class AddUserToConfigs < ActiveRecord::Migration[7.0]
  def change
    add_reference :configs, :user, null: false, foreign_key: true
  end
end
