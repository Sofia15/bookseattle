require "test_helper"

describe BookedRate do
  let(:booked_rate) { BookedRate.new }

  it "must be valid" do
    value(booked_rate).must_be :valid?
  end
end
