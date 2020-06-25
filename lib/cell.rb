class Cell
  def self.coordinates
    ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']
  end

  def self.marks
    Hash[coordinates.collect { |coordinate| [coordinate, ' '] } ]
  end

end