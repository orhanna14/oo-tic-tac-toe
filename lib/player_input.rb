require_relative "coordinates"

class PlayerInput
  attr_reader :stdin, :grid, :coordinates
  attr_accessor :player_choice
  
  def initialize(stdin, grid)
    @stdin = stdin
    @grid = grid
  end

  def get_coordinates
    until coordinates.valid?
      get_user_input
    end
    coordinates.value
  end

  def get_user_input
    stdin.gets.chomp
  end

  def send_to_coordinates
    @coordinates = Coordinates.new(grid, get_user_input)
  end

end