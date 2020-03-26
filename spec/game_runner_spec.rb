require "spec_helper"
require_relative "../lib/game_runner.rb"

RSpec.describe GameRunner do
  describe "#run" do
    context "on start up" do
      it "renders an empty grid with numbers at the top of each column and letters next to each row" do
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

        expect(stdout.string).to include(grid_template)
      end

      it "prompts a user for input" do
        stdout = StringIO.new
        game = GameRunner.new(stdout)

        game.run

        expect(stdout.string).to include("Enter your move >")
      end
    end
  end
end
