require "spec_helper"
require_relative "../lib/player_input.rb"
require_relative "../lib/coordinates.rb"
require_relative "../lib/grid.rb"
require_relative "../lib/grid_printer.rb"

RSpec.describe PlayerInput do
  describe "#get_coordinates" do
     it "returns the value of a valid coordinate" do
       valid_format = StringIO.new
       grid = Grid.new
       grid_printer = GridPrinter.new(valid_format, grid)
       player_input = PlayerInput.new(valid_format, grid, grid_printer)
       allow(valid_format).to receive(:gets).and_return("A1")
       coordinates = Coordinates.new(player_input.get_user_input, double(grid))

       result = player_input.get_coordinates

       expect(result).to eq("A1")
     end
     
     it "repeatedly asks for valid coordinate" do
      invalid_format = StringIO.new
      grid = Grid.new
      grid_printer = GridPrinter.new(invalid_format, grid)
      player_input = PlayerInput.new(invalid_format, grid, grid_printer)
      allow(invalid_format).to receive(:gets).and_return("A6", "B7", "A1")
      coordinates = Coordinates.new(player_input.get_user_input, double(grid))

      result = player_input.get_coordinates

      expect(result).to eq("A1")
    end
  end
end