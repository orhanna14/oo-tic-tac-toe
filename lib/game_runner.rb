require_relative "grid"
require_relative "printer"
require_relative "player_input"
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

  def player_input
    @player_input ||= PlayerInput.new(stdin, grid, printer)
  end

  def run
    introduce_game
    player_1_turn
  end

  private

  def introduce_game
    print_welcome_message
    print_grid
  end

  def player_1_turn
    mark_grid
    print_grid
  end

  def print_welcome_message
    printer.print_welcome_message
  end

  def print_grid
    grid_printer.print_grid
  end

  def get_valid_player_coordinate
    player_input.get_valid_coordinate
  end

  def mark_grid
    grid.mark(get_valid_player_coordinate)
  end
end
