require "spec_helper"
require_relative "../lib/grid.rb"

RSpec.describe Grid do
  describe "#coordinate_valid?" do
    it "is true if in the last row of the grid" do
      valid_row = "A3"
      grid = Grid.new

      expect(grid.coordinate_valid?(valid_row)).to eq true
    end

    it "is false when after the last row of the grid" do
      invalid_row = "A6"
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_row)).to eq false
    end

    it "is false when before the first row of the grid" do
      invalid_row = "A0"
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_row)).to eq false
    end

    it "is true if in the last column of the grid" do
      valid_column = "A3"
      grid = Grid.new

      expect(grid.coordinate_valid?(valid_column)).to eq true
    end

    it "is false when after the last column of the grid" do
      invalid_column = "Z3"
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_column)).to eq false
    end

    it "is true when the input is in the correct format" do
      valid_format = "A3"
      grid = Grid.new

      expect(grid.coordinate_valid?(valid_format)).to eq true
    end

    it "is false when input is not in the correct format" do
      invalid_format = "3A"
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_format)).to eq false
    end

    it "is true when the first character is upper case" do
      valid_upper_case = "A3"
      grid = Grid.new

      expect(grid.coordinate_valid?(valid_upper_case)).to eq true
    end

    it "is false when the first character is not upper case" do
      invalid_lower_case = "a3"
      grid = Grid.new

      expect(grid.coordinate_valid?(invalid_lower_case)).to eq false
    end
  end
end