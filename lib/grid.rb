class Grid
  attr_accessor :structure

  def initialize
    @structure = grid_structure
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

  def grid_structure
    {"A1"=> ' ', "A2"=> ' ', "A3"=> ' ', "B1"=> ' ', "B2"=> ' ', "B3"=> ' ', "C1"=> ' ', "C2"=> ' ', "C3"=> ' '}
  end
end