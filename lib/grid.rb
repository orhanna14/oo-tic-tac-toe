class Grid
  attr_accessor :structure

  def initialize
    @structure = grid_structure
  end

  def mark(coordinate)
    structure[coordinate] = 'X'
  end
  
  def coordinate_invalid?(coordinate)
    !structure.key?(coordinate)
  end

  def get_value(coordinate)
    structure[coordinate]
  end

  def current_grid
    <<~GRID
       1  2  3
       __ __ __
    A |#{structure["A1"]} |#{structure["A2"]} |#{structure["A3"]} |
      |__|__|__|
    B |#{structure["B1"]} |#{structure["B2"]} |#{structure["B3"]} |
      |__|__|__|
    C |#{structure["C1"]} |#{structure["C2"]} |#{structure["C3"]} |
      |__|__|__|
    GRID
  end

  private

  def grid_structure
    {"A1"=> ' ', "A2"=> ' ', "A3"=> ' ', "B1"=> ' ', "B2"=> ' ', "B3"=> ' ', "C1"=> ' ', "C2"=> ' ', "C3"=> ' '}
  end
end