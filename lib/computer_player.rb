class ComputerPlayer
  attr_accessor :computer_choices, :grid

  def initialize(grid)
    @computer_choices = []
    @grid = grid
  end

  def take_turn
    grid.get_valid_options(computer_choices)
    randomize_computer_choice
  end

  private

  def randomize_computer_choice
    computer_choices[rand(computer_choices.size)]
  end
end