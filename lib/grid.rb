class Grid
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
    coordinate = coordinate.to_sym
    coordinates.has_key?(coordinate)
  end

  def mark(coordinate)
    coordinate = coordinate.to_sym
    coordinates[coordinate] = 'X'
  end

  def get_value(coordinate)
    return coordinates[coordinate]
  end

 private

  def coordinates
    {
      "A1": '',
      "A2": '',
      "A3": '',
      "B1": '',
      "B2": '',
      "B3": '',
      "C1": '',
      "C2": '',
      "C3": ''
    }
  end
end