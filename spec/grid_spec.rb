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

  describe "#get_valid_options" do
    it "gives the computer all choices that are available" do
      srand(0)
      coordinate_1 = "A1"
      value_1 = 'X'
      coordinate_2 = "B2"
      value_2 = 'O'
      coordinate_3 = "C3"
      value_3 = 'X'

      grid = Grid.new
      valid_options = []

      grid.mark(coordinate_1, value_1)
      grid.mark(coordinate_2, value_2)
      grid.mark(coordinate_3, value_3)
      
      grid.get_valid_options(valid_options)

      expect(valid_options).to eq(["A2", "A3", "B1", "B3", "C1", "C2"])
    end
  end

  describe "#mark" do
    it "marks a valid coordinate in the grid" do
      coordinate = "A3"
      value = 'X'
      grid = Grid.new

      grid.mark(coordinate, value)

      expect(grid.get_value(coordinate)).to eq('X')
    end
  end

  describe "#mark_with_computer_choice" do
    it "assigns O to the valid coordinates" do
      grid = Grid.new

      grid.mark_with_computer_choice("A1")

      expect(grid.get_value("A1")).to eq("O")
    end
  end

  describe "#mark_with_player_choice" do
  it "assigns X to the valid coordinates" do
    grid = Grid.new

    grid.mark_with_player_choice("A1")

    expect(grid.get_value("A1")).to eq("X")
  end
end
end