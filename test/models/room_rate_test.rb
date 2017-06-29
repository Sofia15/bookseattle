require "test_helper"

describe RoomRate do
  let(:room_rate) { RoomRate.new }

  it "must be valid" do
    value(room_rate).must_be :valid?
  end
end
