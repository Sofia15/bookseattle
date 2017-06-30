class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :account
  has_many :booked_rates

end
