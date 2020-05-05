class ComputerPlayer
  attr_accessor :computer_choices, :grid

  def initialize(grid)
    @computer_choices = []
    @grid = grid
  end

  def get_valid_coordinate
    grid.structure.each { |key, value|
    if value == " "
      computer_choices << key
    end
    }
    computer_choices[rand(computer_choices.size)]
  end

end