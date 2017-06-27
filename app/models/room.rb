class Room < ApplicationRecord

  validates :name, presence: true, uniqueness: true, null: false, length: {minimum: 3, maximum: 50}
  validates :location, presence: true, uniqueness: true

end
