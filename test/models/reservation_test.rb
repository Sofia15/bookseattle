require "test_helper"

describe Reservation do
  let(:reservation) { Reservation.new }

  it "must be valid" do
    value(reservation).must_be :valid?
  end
end
