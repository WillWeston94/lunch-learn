class User < ApplicationRecord
  before_create :generate_api_key
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { message: "has already been taken. Please try a different email." }
  validates :password, presence: true

  def generate_api_key
    loop do
      self.api_key = SecureRandom.hex(10)
      break unless User.exists?(api_key: api_key)
    end
  end
end
