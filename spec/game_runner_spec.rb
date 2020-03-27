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
        stdin = StringIO.new
        game = GameRunner.new(stdout, stdin)
        expect(stdin).to receive(:gets).and_return("A3")

        game.run

        expect(stdout.string).to include(grid_template)
      end

      it "prompts a user for input, returns a message when given invalid input, and quits when input is valid" do
        stdout = StringIO.new
        stdin = StringIO.new
        game = GameRunner.new(stdout, stdin)
        expect(stdin).to receive(:gets).and_return("Z6", "B12", "A3")

        game.run

        expect(stdout.string).to include("Enter your move >")
        expect(stdout.string.scan(/Invalid input. Please try again./).size).to eq(2)
      end
    end
  end
end
