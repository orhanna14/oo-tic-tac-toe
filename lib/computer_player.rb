class ComputerPlayer
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def mark_grid_with_input
    grid.mark_with_player_choice(get_valid_coordinate, marker)
  end

  def get_valid_coordinate
    grid.get_random_coordinate
  end

  def marker
    'O'
  end
end