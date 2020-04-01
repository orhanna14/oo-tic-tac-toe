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
    @printer ||= Printer.new(stdout, grid)
  end

  def run
    printer.print_welcome_message
    demand_valid_coordinates
  end

  private

  def demand_valid_coordinates
    while coordinates_invalid?
      printer.print_coordinates_error
    end
  end

  def coordinates_invalid?
    !grid.grid_coordinates.include?(get_user_input)
  end

  def get_user_input
    stdin.gets.chomp
  end
end
