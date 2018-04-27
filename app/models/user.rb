class User < ApplicationRecord
  validates :name , presence: true
  validates :email, presence: true, uniqueness: true

  has_many :messages 
  has_many :posts

  has_secure_password
end
