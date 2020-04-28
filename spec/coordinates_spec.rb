require "spec_helper"
require_relative "../lib/coordinates.rb"
require_relative "../lib/grid.rb"

RSpec.describe Coordinates do
  describe "#valid?" do
    it "grid returns false from coordinate_valid?" do
      invalid_row_column = "Z10"
      grid = Grid.new
      coordinate = Coordinates.new(invalid_row_column, grid)

      expect(coordinate.valid?).to eq false
    end
    it "grid returns true from coordinate_valid?" do
      valid_row_column = "A1"
      grid = Grid.new
      coordinate = Coordinates.new(valid_row_column, grid)

      expect(coordinate.valid?).to eq true
    end
  end
end