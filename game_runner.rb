class GameRunner
  def initialize(stdout)
    @stdout = stdout
  end

  def run
    grid_template = <<~GRID
       __ __ __
      |  |  |  |
      |__|__|__|
      |  |  |  |
      |__|__|__|
      |  |  |  |
      |__|__|__|
    GRID

    @stdout.print(grid_template)
  end
end
