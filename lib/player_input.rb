require_relative "coordinates"

class PlayerInput
  attr_reader :stdin, :grid, :grid_printer, :coordinates
  
  def initialize(stdin, grid, grid_printer)
    @stdin = stdin
    @grid = grid
    @grid_printer = grid_printer
  end

  def get_coordinates
    until coordinates.valid?
      get_and_validate
    end
    coordinates.value
  end

  def get_and_validate
    get_user_input
  end

  def get_user_input
    stdin.gets.chomp
  end

  def coordinates
    @coordinates = Coordinates.new(get_user_input)
  end
end