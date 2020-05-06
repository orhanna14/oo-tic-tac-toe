require "spec_helper"
require_relative "../lib/game_runner.rb"

RSpec.describe GameRunner do
  describe "#run" do
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

      it "when a user gives invalid input it returns a message" do
        stdout = StringIO.new
        stdin = StringIO.new
        game = GameRunner.new(stdout, stdin)
        expect(stdin).to receive(:gets).and_return("Z6", "B12", "A3")

        game.run

        expect(stdout.string).to include("Enter your move >")
        expect(stdout.string.scan(/Invalid input. Please try again./).size).to eq(2)
      end

      it "when a user gives valid input renders the grid with an X inside the correct box" do
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
      
      it "after the user takes a turn, the computer takes a turn, and the grid is re-rendered with an O in a random location" do
        def seed_random_generator_for_computer_turn
          srand(0)
        end
        stdout = StringIO.new
        player_turn = StringIO.new
        game = GameRunner.new(stdout, player_turn)
        expect(player_turn).to receive(:gets).and_return("C3")
        seed_random_generator_for_computer_turn
        
        grid_marked = <<~GRID_MARKED
        1  2  3
        __ __ __
     A |  |  |  |
       |__|__|__|
     B |  |O |  |
       |__|__|__|
     C |  |  |X |
       |__|__|__|
        GRID_MARKED

        game.run

        expect(stdout.string).to include(grid_marked)
      end
  end
end
