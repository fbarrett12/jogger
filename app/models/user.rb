class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_secure_password

  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true 
  validates :password_confirmation, presence: true
end
