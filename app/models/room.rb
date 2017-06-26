class Room < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: true
  
end
