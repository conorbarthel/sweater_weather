class User < ApplicationRecord
  validates_presence_of :password, require: true
  validates :email, uniqueness: true, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  has_secure_token :api_key

  before_create :set_api_key

  private

  def set_api_key
    self.api_key = SecureRandom.hex(13)
  end
end
