class User < ApplicationRecord
  has_secure_password validations: true
  has_many :baggages
  has_many :deliveries
  validates :staff_number, presence: true, uniqueness: true, numericality: true
  validates :email, presence: true, uniqueness: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'
end
