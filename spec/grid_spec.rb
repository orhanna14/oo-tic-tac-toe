require "spec_helper"
require_relative "../lib/grid.rb"

RSpec.describe Grid do
  describe "#coordinate_invalid?" do
    it "is false if in the first row and first column of the grid" do
      valid_row_column = "A1"
      grid = Grid.new

      expect(grid.coordinate_invalid?(valid_row_column)).to eq false
    end

    it "is false if somewhere in the middle of the grid" do
      valid_row_column = "B2"
      grid = Grid.new

      expect(grid.coordinate_invalid?(valid_row_column)).to eq false
    end

    it "is false if in the last row and last column of the grid" do
      valid_row_column = "C3"
      grid = Grid.new

      expect(grid.coordinate_invalid?(valid_row_column)).to eq false
    end

    it "is true when after the last row of the grid" do
      invalid_row = "D1"
      grid = Grid.new

      expect(grid.coordinate_invalid?(invalid_row)).to eq true
    end

    it "is true when before the first column of the grid" do
      invalid_row = "A0"
      grid = Grid.new

      expect(grid.coordinate_invalid?(invalid_row)).to eq true
    end

    it "is true when after the last column of the grid" do
      invalid_column = "B4"
      grid = Grid.new

      expect(grid.coordinate_invalid?(invalid_column)).to eq true
    end

    it "is true when input is not in the correct format" do
      invalid_format = "3A"
      grid = Grid.new

      expect(grid.coordinate_invalid?(invalid_format)).to eq true
    end

    it "is true when input is too many characters" do
      invalid_format = "A3 "
      grid = Grid.new

      expect(grid.coordinate_invalid?(invalid_format)).to eq true
    end

    it "is true when input is too few characters" do
      invalid_format = "A"
      grid = Grid.new

      expect(grid.coordinate_invalid?(invalid_format)).to eq true
    end

    it "is true when the first character is not upper case" do
      invalid_lower_case = "a3"
      grid = Grid.new

      expect(grid.coordinate_invalid?(invalid_lower_case)).to eq true
    end
  end

  describe "#mark" do
    it "takes in a valid coordinate, and gives it a marked value in coordinates" do
      coordinate = "A3"
      grid = Grid.new

      grid.mark(coordinate)

      expect(grid.coordinates[coordinate]).to eq('X')
    end
  end
end