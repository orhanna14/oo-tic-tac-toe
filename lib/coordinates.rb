class Coordinates
  attr_reader :value, :grid

  def initialize(value, grid)
    @value = value
    @grid = grid
  end

  def valid?
    !grid.coordinate_invalid?(value)
  end
end