class Coordinates
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def valid?(grid)
    grid.coordinate_valid?(value)
  end
end