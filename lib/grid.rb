class Grid
  attr_accessor :structure

  def initialize
    @structure = grid_structure
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

  def get_computer_choice
    get_random_key
  end

  private

  def grid_structure
    {"A1"=> ' ', "A2"=> ' ', "A3"=> ' ', "B1"=> ' ', "B2"=> ' ', "B3"=> ' ', "C1"=> ' ', "C2"=> ' ', "C3"=> ' '}
  end

  def get_random_key
    computer_choices = []
    structure.each { |key, value|
      if value == " "
        computer_choices << key
      end
    }
    computer_choices[rand(computer_choices.size)]
  end
end