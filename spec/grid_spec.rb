require "spec_helper"
require_relative "../lib/grid.rb"

RSpec.describe Grid do
  describe "#coordinate_valid?" do
    it "says a valid coordinate is in the coordinate values" do
      coordinate = "A3"
      grid = Grid.new

      expect(grid.coordinate_valid?(coordinate)).to eq true
    end

    it "says an invalid coordinate is not in the coordinate values" do
      coordinate = "Z6"
      grid = Grid.new

      expect(grid.coordinate_valid?(coordinate)).to eq false
    end
  end
end