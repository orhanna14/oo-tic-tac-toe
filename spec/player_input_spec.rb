require "spec_helper"
require_relative "../lib/player_input.rb"
require_relative "../lib/coordinates.rb"
require_relative "../lib/grid.rb"
require_relative "../lib/printer.rb"

RSpec.describe PlayerInput do
  describe "#get_valid_coordinate" do
     it "repeatedly asks for valid coordinate, returns the value when valid" do
      invalid_format = StringIO.new
      grid = Grid.new
      printer = Printer.new(invalid_format)
      player_input = PlayerInput.new(invalid_format, grid, printer)
      allow(invalid_format).to receive(:gets).and_return("A6", "B7", "A1")
      coordinates = Coordinates.new(player_input.get_user_input)

      result = player_input.get_valid_coordinate

      expect(result).to eq("A1")
    end
  end
end