class Grid
  attr_accessor :coordinates

  def initialize
    @coordinates = reset_grid
  end

  def coordinate_valid?(coordinate)
    if coordinates.key?(coordinate)
      mark(coordinate)
      return true
    end
    return false
  end

  def mark(coordinate)
    coordinates[coordinate] = 'X'
  end

  def get_value(coordinate)
    coordinates[coordinate]
  end

  private

  def reset_grid
    {"A1"=> '', "A2"=> '', "A3"=> '', "B1"=> '', "B2"=> '', "B3"=> '', "C1"=> '', "C2"=> '', "C3"=> ''}
  end
end