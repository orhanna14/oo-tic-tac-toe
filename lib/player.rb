require_relative "coordinates"
require_relative "null_coordinates"

class Player
  attr_reader :stdin, :grid, :printer
  
  def initialize(stdin, grid, printer)
    @stdin = stdin
    @grid = grid
    @printer = printer
  end

  def take_turn
    until coordinates.valid?(grid)
      ask_for_coordinate_and_print_error
    end
    coordinates.value
  end

  def marker
    'X'
  end

  private

  def ask_for_coordinate_and_print_error
    get_user_coordinate
    unless coordinates.valid?(grid)
      printer.print_coordinates_error
    end
  end
  
  def coordinates
    @coordinates ||= NullCoordinates.new
  end

  def get_user_coordinate
    @coordinates = Coordinates.new(get_user_input)
  end

  def get_user_input
    stdin.gets.chomp
  end
end