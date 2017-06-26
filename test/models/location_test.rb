require "test_helper"

describe Location do
  let(:location) { Location.new }

  it "must be valid" do
    value(location).must_be :valid?
  end
end
