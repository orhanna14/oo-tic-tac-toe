require "spec_helper"
require_relative "../lib/game_runner.rb"

RSpec.describe GameRunner do
  describe "#run" do
    it "on start up, an empty grid is rendered on the screen with numbers at the top of each column and letters next to each row" do
      grid_template = <<~GRID
        1  2  3
       __ __ __
    A |  |  |  |
      |__|__|__|
    B |  |  |  |
      |__|__|__|
    C |  |  |  |
      |__|__|__|
      GRID

      stdout = StringIO.new
      game_start = GameRunner.new(stdout)

      game_start.run

      expect(stdout.string).to eq(grid_template)
    end
  end
end
