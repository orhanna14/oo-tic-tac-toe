class ComputerPlayer
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def take_turn
    grid.get_valid_option
  end

  def marker
    'O'
  end
end