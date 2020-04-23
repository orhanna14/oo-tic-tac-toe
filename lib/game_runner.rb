require_relative "grid"
require_relative "printer"
require_relative "player_input"

class GameRunner
  attr_reader :stdout, :stdin, :grid, :printer, :player_input

  def initialize(stdout, stdin, grid = Grid.new)
    @stdout = stdout
    @stdin = stdin
    @grid = grid
    @player_input = PlayerInput.new(stdin)
  end

  def printer
    @printer ||= Printer.new(stdout)
  end

  def run
    printer.print_welcome_message
    printer.print_updated_grid(grid.coordinates)
    get_valid_coordinate
    #mark_grid
    printer.print_updated_grid(grid.coordinates)
  end

  private

  def get_valid_coordinate
    while invalid_coordinate?
      printer.print_coordinates_error
    end
  end

  def invalid_coordinate?
    !mark_grid
    #player_input.get_coordinates
  end

  def mark_grid
    grid.mark(player_input.get_user_input)
  end
end
