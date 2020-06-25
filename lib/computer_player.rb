class ComputerPlayer
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def take_turn
    grid.get_random_coordinate
  end

  def marker
    'O'
  end
end