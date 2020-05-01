require_relative "coordinates"
require_relative "null_coordinates"

class PlayerTurn
  attr_reader :stdin, :grid, :printer
  
  def initialize(stdin, grid, printer)
    @stdin = stdin
    @grid = grid
    @printer = printer
  end

  def get_valid_coordinate
    until coordinates.valid?(grid)
      ask_for_coordinate_and_print_error
    end
    coordinates.value
  end

  def ask_for_coordinate_and_print_error
    initialize_input_as_a_coordinate
    unless coordinates.valid?(grid)
      printer.print_coordinates_error
    end
  end

  def get_initial_input
    stdin.gets.chomp
  end

  private

  def coordinates
    @coordinates ||= NullCoordinates.new
  end

  def initialize_input_as_a_coordinate
    @coordinates = Coordinates.new(get_initial_input)
  end
end