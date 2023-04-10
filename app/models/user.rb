class User < ApplicationRecord
  has_secure_password validations: false

  def fullname
    "#{firstname} #{lastname}"
  end
end
