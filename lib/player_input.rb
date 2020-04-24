require_relative "coordinates"
require_relative "grid_printer"

class PlayerInput
  attr_reader :stdin, :coordinates
  
  def initialize(stdin)
    @stdin = stdin
    @grid_view = GridPrinter.new
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