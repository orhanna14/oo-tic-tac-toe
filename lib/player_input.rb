require_relative "coordinates"

class PlayerInput
  attr_reader :stdin, :grid, :printer, :coordinates
  
  def initialize(stdin, grid, printer)
    @stdin = stdin
    @grid = grid
    @printer = printer
  end

  def get_valid_coordinate
    while invalid_coordinate?
      printer.print_coordinates_error
    end
  end

  def invalid_coordinate?
    #!coordinates.valid?
    !grid.mark(coordinate_input.value)
  end

  # def mark_grid
  #   grid.mark(coordinate_input.value)
  # end

  def get_user_input
    stdin.gets.chomp
  end

  def coordinate_input
    @coordinates = Coordinates.new(get_user_input, grid)
  end
end