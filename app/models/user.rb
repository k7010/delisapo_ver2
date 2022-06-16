class User < ApplicationRecord::Base
  has_secure_password validations: true

  validates :email, presence: true, uniqueness: true
end
