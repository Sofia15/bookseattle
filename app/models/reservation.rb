class Reservation < ApplicationRecord
  belongs_to :room

  validates :reservation_duration, presence: true, uniqueness: {
    scope: [:room_id],
    message: 'The room has already been reserved.'
  }

end
