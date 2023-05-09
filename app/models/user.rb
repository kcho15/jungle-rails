class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, 
    presence: true,
    uniqueness: { case_sensitive: false }
  validates :password,
    presence: true,
    confirmation: true,
    length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase 
    user = User.find_by_email(email)
    user_password = user.authenticate(password) 
    user && user_password ? user : nil
  end

end