class Grid
  attr_accessor :structure

  def initialize
    @structure = build_grid
  end

  def mark_with_player_choice(valid_choice, marker)
    mark(valid_choice, marker)
  end

  def mark(coordinate, value)
    structure[coordinate] = value
  end
  
  def coordinate_valid?(coordinate)
    structure.key?(coordinate)
  end

  def get_value(coordinate)
    structure[coordinate]
  end

  def get_valid_options(computer_choices)
    structure.each { |key, value|
    if value == " "
      computer_choices << key
    end
    }
  end

  private

  def build_grid
    coordinates = []
    row.each do |letter|
      column.each do |number|
         coordinates.push(letter + number)
      end
    end
    Hash[coordinates.collect { |coordinate| [coordinate, ' '] } ]
  end

  def row
    ['A', 'B', 'C']
  end

  def column
    ['1', '2', '3']
  end
end