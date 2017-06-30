class BookedRate < ApplicationRecord
  belongs_to :reservation
  belongs_to :room_rate
end
