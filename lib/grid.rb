class Grid
  attr_accessor :coordinates

  def initialize
    @coordinates = reset_grid
  end

  def template
    <<~GRID
        1  2  3
       __ __ __
    A |  |  |  |
      |__|__|__|
    B |  |  |  |
      |__|__|__|
    C |  |  |  |
      |__|__|__|
    GRID
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

  def update_grid
    <<~GRID
       1  2  3
       __ __ __
    A | #{coordinates["A1"]} | #{coordinates["A2"]} | #{coordinates["A3"]} |
      |__|__|__|
    B | #{coordinates["B1"]} | #{coordinates["B2"]} | #{coordinates["B3"]} |
      |__|__|__|
    C | #{coordinates["C1"]} | #{coordinates["C2"]} | #{coordinates["C3"]} |
      |__|__|__|
    GRID
  end

  private

  def reset_grid
    {"A1"=> '', "A2"=> '', "A3"=> '', "B1"=> '', "B2"=> '', "B3"=> '', "C1"=> '', "C2"=> '', "C3"=> ''}
  end
end