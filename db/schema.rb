# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_215_150_708) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'configs', force: :cascade do |t|
    t.integer 'round_up_to'
    t.boolean 'percentage'
    t.integer 'round_up_cap'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id', null: false
    t.index ['user_id'], name: 'index_configs_on_user_id'
  end

  create_table 'receiver_accounts', force: :cascade do |t|
    t.string 'account_name'
    t.integer 'account_no'
    t.integer 'sort_code'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id', null: false
    t.float 'received_amount'
    t.index ['user_id'], name: 'index_receiver_accounts_on_user_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.decimal 'amount'
    t.decimal 'round_up'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id', null: false
    t.string 'name'
    t.index ['user_id'], name: 'index_transactions_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'configs', 'users'
  add_foreign_key 'receiver_accounts', 'users'
  add_foreign_key 'transactions', 'users'
end
