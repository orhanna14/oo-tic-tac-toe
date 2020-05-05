require "spec_helper"
require_relative "../lib/grid.rb"

RSpec.describe Grid do
  describe "#coordinate_valid?" do
    it "is true if in the first row and first column of the grid" do
      valid_row_column = "A1"
      grid = Grid.new

      expect(grid.coordinate_valid?(valid_row_column)).to eq true
    end

    it "is true if somewhere in the middle of the grid" do
      valid_row_column = "B2"
      grid = Grid.new

      expect(grid.coordinate_valid?(valid_row_column)).to eq true
    end

    it "is true if in the last row and last column of the grid" do
      valid_row_column = "C3"
      grid = Grid.new

      expect(grid.coordinate_valid?(valid_row_column)).to eq true
    end

    it "is false when after the last row of the grid" do
      invalid_row = "D1"
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_row)).to eq false
    end

    it "is false when before the first column of the grid" do
      invalid_row = "A0"
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_row)).to eq false
    end

    it "is false when after the last column of the grid" do
      invalid_column = "B4"
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_column)).to eq false
    end

    it "is false when input is not in the correct format" do
      invalid_format = "3A"
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_format)).to eq false
    end

    it "is false when input is too many characters" do
      invalid_format = "A3 "
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_format)).to eq false
    end

    it "is false when input is too few characters" do
      invalid_format = "A"
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_format)).to eq false
    end

    it "is false when the first character is not upper case" do
      invalid_lower_case = "a3"
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_lower_case)).to eq false
    end
  end

  it "#mark takes in a valid coordinate, and gives it a marked value in coordinates" do
    coordinate = "A3"
    value = 'X'
    grid = Grid.new

    grid.mark(coordinate, value)

    expect(grid.get_value(coordinate)).to eq('X')
  end

  it "#get_random_key returns a random key from the structure" do
    grid = Grid.new
    valid_keys = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]

    computer_coordinate = grid.get_random_key

    expect(valid_keys).to include(computer_coordinate)
  end
end