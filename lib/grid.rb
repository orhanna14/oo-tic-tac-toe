require_relative 'cell.rb'

class Grid
  attr_accessor :cells, :computer_options

  def initialize
    @cells = build_grid
    @computer_options = []
  end

  def mark_with_player_choice(valid_choice, marker)
    mark(valid_choice, marker)
  end

  def mark(coordinate, value)
    cells[coordinate] = value
  end
  
  def coordinate_valid?(coordinate)
    cells.key?(coordinate)
  end

  def get_value(coordinate)
    cells[coordinate]
  end

  def get_random_coordinate
    get_valid_options
    randomize_computer_choice
  end

  private

  def get_valid_options
    cells.each { |key, value|
      if value == " "
        computer_options << key
      end
    }
  end

  def randomize_computer_choice
    computer_options[rand(computer_options.size)]
  end

  def build_grid
    Cell.coordinates
    Cell.marks
  end
end