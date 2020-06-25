require "spec_helper"
require_relative "../lib/player.rb"
require_relative "../lib/coordinates.rb"
require_relative "../lib/grid.rb"
require_relative "../lib/printer.rb"

RSpec.describe Player do
  describe "#get_valid_coordinate" do
     it "repeatedly asks for valid coordinate, returns the value when valid" do
      player_input = StringIO.new
      grid = Grid.new
      printer = Printer.new(player_input)
      player = Player.new(player_input, grid, printer)
      allow(player_input).to receive(:gets).and_return("A6", "B7", "A1")
      coordinates = Coordinates.new(player_input)

      result = player.get_valid_coordinate

      expect(result).to eq("A1")
    end
  end
end