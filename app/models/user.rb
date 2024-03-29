class User < ApplicationRecord
  include Decorable

  has_secure_password
  has_many :annotations
  has_many :artist_editors
  has_many :artists, through: :artist_editors

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: Constants::User::REGEX_EMAIL
  normalizes :email, with: lambda { |email| email.downcase.strip }

  validates :password, presence: true if Rails.env.production?
  validates_format_of :password, with: Constants::User::PASSWORD_REGEX if Rails.env.production?

  enum role: {
    user: "user",
    admin: "admin",
    super_admin: "super_admin"
  }, _prefix: true

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  generates_token_for :email_confirmation, expires_in: 24.hours do
    email
  end
end
