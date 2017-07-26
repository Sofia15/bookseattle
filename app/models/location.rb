class Location < ApplicationRecord

  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 50}
  validate :timezone_exists

  private

  def timezone_exists
    return if ActiveSupport::TimeZone[timezone].present?
    errors.add(:timezone, "does not exist")
  end
  
end
