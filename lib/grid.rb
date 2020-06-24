class Grid
  attr_accessor :structure

  def initialize
    @structure = build_grid
  end

  def player_x
    'X'
  end

  def player_o
    'O'
  end

  def mark_with_computer_choice(valid_choice)
    mark(valid_choice, player_o)
  end

  def mark_with_player_choice(valid_choice)
    mark(valid_choice, player_x)
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