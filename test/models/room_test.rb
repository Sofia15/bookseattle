require "test_helper"

describe Room do
  let(:room) { Room.new }

  it "must be valid" do
    value(room).must_be :valid?
  end
end
