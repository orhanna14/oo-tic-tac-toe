class Coordinates
  attr_reader :grid, :value, :values

  def initialize(grid, value)
    @grid = grid
    @value = value
    @values = coordinate_values
  end

  def valid?
    values.include?(value)
  end

  private

  def coordinate_values
     ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  end
end