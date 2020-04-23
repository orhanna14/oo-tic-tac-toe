class Grid
  attr_accessor :coordinates

  def initialize
    @coordinates = grid_structure
  end

  def mark(coordinate)
    return if coordinate_invalid?(coordinate)
    coordinates[coordinate] = 'X'
  end
  
  def coordinate_invalid?(coordinate)
    !coordinates.key?(coordinate)
  end

  def get_value(coordinate)
    coordinates[coordinate]
  end

  private

  def grid_structure
    {"A1"=> ' ', "A2"=> ' ', "A3"=> ' ', "B1"=> ' ', "B2"=> ' ', "B3"=> ' ', "C1"=> ' ', "C2"=> ' ', "C3"=> ' '}
  end
end