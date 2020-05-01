require_relative "coordinates"
require_relative "null_coordinates"

class PlayerInput
  attr_reader :stdin, :grid, :printer
  
  def initialize(stdin, grid, printer)
    @stdin = stdin
    @grid = grid
    @printer = printer
  end

  def get_valid_coordinate
    until coordinates.valid?(grid)
      get_coordinate_and_print_error
    end
    coordinates.value
  end

  def get_coordinate_and_print_error
    get_coordinate_input
    unless coordinates.valid?(grid)
      printer.print_coordinates_error
    end
  end

  def coordinates
    @coordinates ||= NullCoordinates.new
  end

  def get_coordinate_input
    @coordinates = Coordinates.new(get_user_input)
  end

  def get_user_input
    stdin.gets.chomp
  end

end