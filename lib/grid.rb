class Grid
  attr_accessor :structure, :computer_options

  def initialize
    @structure = build_grid
    @computer_options = []
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

  def get_random_coordinate
    get_valid_options
    randomize_computer_choice
  end

  private

  def get_valid_options
    structure.each { |key, value|
      if value == " "
        computer_options << key
      end
    }
  end

  def randomize_computer_choice
    computer_options[rand(computer_options.size)]
  end

  def build_grid
    coordinates = ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']
    Hash[coordinates.collect { |coordinate| [coordinate, ' '] } ]
  end
end