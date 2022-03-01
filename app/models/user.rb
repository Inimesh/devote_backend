# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :transactions
  has_many :receiver_accounts
  has_one :config

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 4 }
end
