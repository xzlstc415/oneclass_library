# model User
class User < ActiveRecord::Base
  has_secure_password

  # Validations
  validates_presence_of :email
end
