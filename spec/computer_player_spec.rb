require "spec_helper"
require_relative "../lib/computer_player.rb"
require_relative "../lib/grid.rb"

RSpec.describe ComputerPlayer do
  describe "#take_turn" do
    it "gives the computer all choices that are available" do
      srand(0)
      coordinate_1 = "A1"
      value_1 = 'X'
      coordinate_2 = "B2"
      value_2 = 'O'
      coordinate_3 = "C3"
      value_3 = 'X'

      grid = Grid.new
      computer_player = ComputerPlayer.new(grid)
      valid_options = ["A2", "B1", "B3", "C1", "C2"]

      grid.mark(coordinate_1, value_1)
      grid.mark(coordinate_2, value_2)
      grid.mark(coordinate_3, value_3)
      
      choice = computer_player.take_turn

      expect(valid_options).to include(choice)
    end
  end
end