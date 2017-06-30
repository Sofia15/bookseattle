class Room < ApplicationRecord
  has_many :reservations
  has_many :room_rates
  belongs_to :location

  validates :name, presence: true, uniqueness: true, null: false, length: {minimum: 3, maximum: 50}
  validates :location, presence: true, uniqueness: true

end
