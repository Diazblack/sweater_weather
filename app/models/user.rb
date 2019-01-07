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
end
