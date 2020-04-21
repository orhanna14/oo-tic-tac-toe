require_relative "grid"
require_relative "printer"

class GameRunner
  attr_reader :stdout, :stdin, :grid, :printer

  def initialize(stdout, stdin, grid = Grid.new)
    @stdout = stdout
    @stdin = stdin
    @grid = grid
  end

  def printer
    @printer ||= Printer.new(stdout)
  end

  def run
    printer.print_welcome_message
    printer.print_updated_grid(grid.coordinates)
    ask_for_coordinate
    printer.print_updated_grid(grid.coordinates)
  end

  private

  def ask_for_coordinate
    while invalid_coordinate?
      printer.print_coordinates_error
    end
  end

  def invalid_coordinate?
    !grid.mark(get_user_input)
  end

  def get_user_input
    stdin.gets.chomp
  end
end
