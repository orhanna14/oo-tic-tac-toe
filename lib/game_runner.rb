require_relative "grid"
require_relative "printer"
require_relative "player"
require_relative "computer_player"
require_relative "grid_printer"

class GameRunner
  attr_reader :stdout, :stdin, :grid

  def initialize(stdout, stdin, grid = Grid.new)
    @stdout = stdout
    @stdin = stdin
    @grid = grid
  end

  def printer
    @printer ||= Printer.new(stdout)
  end

  def grid_printer
    @grid_printer ||= GridPrinter.new(stdout, grid)
  end

  def player
    @player ||= Player.new(stdin, grid, printer)
  end

  def computer_player
    @computer_player ||= ComputerPlayer.new(grid)
  end

  def run
    introduce_game
    player_turn
    computer_turn
  end

  private

  def introduce_game
    print_welcome_message
    print_grid
  end

  def player_turn
    player.mark_grid_with_input
    print_grid
  end

  def computer_turn
    computer_player.mark_grid_with_input
    print_grid
  end

  def print_welcome_message
    printer.print_welcome_message
  end

  def print_grid
    grid_printer.print_grid
  end
end
