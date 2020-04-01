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
    end

    context "when a user gives invalid input" do
      it "returns a message" do
        stdout = StringIO.new
        stdin = StringIO.new
        game = GameRunner.new(stdout, stdin)
        expect(stdin).to receive(:gets).and_return("Z6", "B12", "A3")

        game.run

        expect(stdout.string).to include("Enter your move >")
        expect(stdout.string.scan(/Invalid input. Please try again./).size).to eq(2)
      end
    end

    context "when a user gives valid input" do
      it "renders the grid with an X inside the correct box, and then quits" do
        stdout = StringIO.new
        stdin = StringIO.new
        game = GameRunner.new(stdout, stdin)
        expect(stdin).to receive(:gets).and_return("B3")
        grid_marked = <<~GRID_MARKED
           1  2  3
           __ __ __
        A |  |  |  |
          |__|__|__|
        B |  |  |X |
          |__|__|__|
        C |  |  |  |
          |__|__|__|
          GRID_MARKED

        game.run

        expect(stdout.string).to include(grid_marked)
      end
    end
  end
end
