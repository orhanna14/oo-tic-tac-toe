require "spec_helper"
require_relative "../lib/grid.rb"

RSpec.describe Grid do
  describe "#mark" do
    it "takes in a valid coordinate, and gives it a marked value in coordinates" do
      coordinate = "A3"
      grid = Grid.new

      grid.mark(coordinate)

      expect(grid.get_value(coordinate)).to eq('X')
    end
  end
end