require_relative "coordinates"

class PlayerInput
  attr_reader :stdin, :grid, :coordinates
  attr_accessor :player_choice
  
  def initialize(stdin, grid)
    @stdin = stdin
    @grid = grid
  end

  def get_coordinate
    #@coordinates = Coordinates.new(grid, stdin.gets.chomp)
    stdin.gets.chomp
  end

end