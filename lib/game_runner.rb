class GameRunner
  attr_reader :stdout

  def grid_template
    <<~GRID
       __ __ __
      |  |  |  |
      |__|__|__|
      |  |  |  |
      |__|__|__|
      |  |  |  |
      |__|__|__|
    GRID
  end

  def initialize(stdout)
    @stdout = stdout
  end

  def run
    stdout.print(grid_template)
  end
end
