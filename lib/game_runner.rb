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
    @printer ||= Printer.new(stdout)
    @grid_printer = GridPrinter.new(stdout, grid)
    @player_input = PlayerInput.new(stdin, grid, printer)
  end

  def run
    printer.print_welcome_message
    grid_printer.print_grid
    get_valid_coordinate
    #player_input.mark_grid
    grid_printer.print_grid
  end

  private

  def get_valid_coordinate
    player_input.get_valid_coordinate
  end
end
