require_relative "grid"
require_relative "printer"
require_relative "player_input"
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

  def player_input
    @player_input ||= PlayerInput.new(stdin, grid, printer)
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
    mark_grid_with_player_input
    print_grid
  end

  def computer_turn
    mark_grid_with_computer_input
    print_grid
  end

  def print_welcome_message
    printer.print_welcome_message
  end

  def print_grid
    grid_printer.print_grid
  end

  def mark_grid_with_player_input
    grid.mark(get_valid_player_coordinate, grid.player_x)
  end

  def mark_grid_with_computer_input
    grid.mark(get_computer_coordinate, grid.player_o)
  end

  def get_computer_coordinate
    computer_player.get_valid_coordinate
  end

  def get_valid_player_coordinate
    player_input.get_valid_coordinate
  end

end
