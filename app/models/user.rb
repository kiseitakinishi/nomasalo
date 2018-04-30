class User < ApplicationRecord
  validates :name , presence: true
  validates :email, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader

  has_many :messages
  has_many :posts

  has_secure_password

  # def country_name
  #   country = ISO3166::Country[country_code]
  #   country.translations[I18n.locale.to_s] || country.name
  # end

end
