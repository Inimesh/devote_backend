class User < ApplicationRecord
    has_secure_password
    has_many :transactions

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }
end