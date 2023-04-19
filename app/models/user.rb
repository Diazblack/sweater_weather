require 'securerandom'

class User < ApplicationRecord
  has_many :favorites

  validates_presence_of :email, :password
  validates_uniqueness_of :email

  has_secure_password

  before_create :create_key

  def create_key
    self.api_key = SecureRandom.base64(30)
  end

  def delete_favorite(location)
    fav_to_delete = self.favorites.find_by(location: location)
    fav_to_delete.delete if fav_to_delete
    self.favorites
  end
end
