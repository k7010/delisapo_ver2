class Baggage < ApplicationRecord
  belongs_to :user
  has_many :deliveries

  with_options presence: true do
    validates :address
    validates :block
    validates :family_name
    validates :first_name
    validates :time_specification
  end
end
