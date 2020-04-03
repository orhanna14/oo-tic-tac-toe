require "spec_helper"
require_relative "../lib/grid.rb"

RSpec.describe Grid do
  describe "#coordinate_valid?" do
    it "validates if a row number exists in the grid" do
      valid_row = "A3"
      invalid_row = "A6"
      grid = Grid.new

      expect(grid.coordinate_valid?(valid_row)).to eq true
      expect(grid.coordinate_valid?(invalid_row)).to eq false
    end

    it "validates if a column letter exists in the grid" do
      valid_column = "A3"
      invalid_column = "Z3"
      grid = Grid.new

      expect(grid.coordinate_valid?(valid_column)).to eq true
      expect(grid.coordinate_valid?(invalid_column)).to eq false
    end

    it "validates that the input is in the correct format" do
      valid_format = "A3"
      invalid_format = "3A"
      grid = Grid.new

      expect(grid.coordinate_valid?(valid_format)).to eq true
      expect(grid.coordinate_valid?(invalid_format)).to eq false
    end

    it "validates that the first character is upper case" do
      valid_upper_case = "A3"
      invalid_lower_case = "a3"
      grid = Grid.new

      expect(grid.coordinate_valid?(valid_upper_case)).to eq true
      expect(grid.coordinate_valid?(invalid_lower_case)).to eq false
    end
  end
end