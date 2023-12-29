class User < ApplicationRecord
  has_secure_password
  has_many :annotations

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: Constants::User::REGEX_EMAIL
  normalizes :email, with: ->(email) { email.downcase.strip }

  validates :password, presence: true
  validates_format_of :password, with: Constants::User::PASSWORD_REGEX

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  generates_token_for :email_confirmation, expires_in: 24.hours do
    email
  end
end
