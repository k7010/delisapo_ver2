class User < ApplicationRecord
  has_secure_password
  has_many :baggages
  has_many :deliveries
  validates :staff_number, presence: true, uniqueness: true, numericality: true
  validates :email, presence: true, uniqueness: true
end
