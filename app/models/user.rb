class User < ApplicationRecord
  has_secure_password
  has_many :user_actions
  has_many :actions, through: :user_actions
  has_many :plants
end
