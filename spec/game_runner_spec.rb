require "spec_helper"
require_relative "../lib/game_runner.rb"

RSpec.describe GameRunner do
  describe "#run" do
    it "on start up, an empty grid is rendered on the screen" do
      grid_template = <<~GRID
         __ __ __
        |  |  |  |
        |__|__|__|
        |  |  |  |
        |__|__|__|
        |  |  |  |
        |__|__|__|
      GRID
      stdout = StringIO.new
      game_start = GameRunner.new(stdout)

      game_start.run

      expect(stdout.string).to eq(grid_template)
    end
  end
end
