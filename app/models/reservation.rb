class Reservation < ApplicationRecord
  belongs_to :room

  validates :reservation_duration, presence: true, uniqueness: {
    scope: [:room_id],
    message: 'The room is not available.'
  }

  validate :validate_reservation_duration

  validate :validate_guest_count

  before_save :calculate_total_price

  def validate_reservation_duration
    reservations = Reservation.where(cancelled: false, room_id: room.id)
    if reservations.any? {|r| reservation_duration.overlaps? r.reservation_duration}
      errors.add(:reservation_duration, "The room is not available")
    end
  end

  def calculate_total_price

    weekdays, weekends = reservation_duration.partition(&:on_weekday?)
    self.total_price = (weekdays.count * room.weekday_rate) + (weekends.count * room.weekend_rate)
  end

  def as_json(options={})
    super.as_json(options).merge(total_price: total_price.to_f)
  end

  def validate_guest_count
    unless guest_count <= room.max_guests
      errors.add(:guest_count, "Less people please!!")
    end
  end

end
