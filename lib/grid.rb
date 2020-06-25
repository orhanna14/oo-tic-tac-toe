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

  def get_valid_option
    get_options
    randomize_computer_choice
  end

  private

  def get_options
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