require_relative "grid"
require_relative "printer"
require_relative "player_input"
require_relative "grid_printer"

class GameRunner
  attr_reader :stdout, :stdin, :grid, :printer, :player_input, :grid_printer

  def initialize(stdout, stdin, grid = Grid.new)
    @stdout = stdout
    @stdin = stdin
    @grid = grid
    @grid_printer = GridPrinter.new(stdout, grid)
    @player_input = PlayerInput.new(stdin, grid, grid_printer)
  end

  def printer
    @printer ||= Printer.new(stdout)
  end

  def run
    printer.print_welcome_message
    grid_printer.print_grid
    get_valid_coordinate
    grid_printer.print_grid
  end

  private

  def get_valid_coordinate
    while invalid_coordinate?
      printer.print_coordinates_error
    end
  end

  def invalid_coordinate?
    !mark_grid
  end

  def mark_grid
    grid.mark(player_input.get_user_input)
  end
end
