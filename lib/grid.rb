class Grid
  attr_accessor :coordinates

  def initialize
    @coordinates = reset_board
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
    coordinates.key?(coordinate)
  end

  def mark(coordinate)
    coordinates[coordinate] = 'X'
  end

  def get_value(coordinate)
    coordinates[coordinate]
  end

  private

  def reset_board
    {"A1"=> '', "A2"=> '', "A3"=> '', "B1"=> '', "B2"=> '', "B3"=> '', "C1"=> '', "C2"=> '', "C3"=> ''}
  end
end