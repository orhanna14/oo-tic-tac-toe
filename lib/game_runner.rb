class GameRunner
  attr_reader :stdout

  def grid_template
    <<~GRID
       1  2  3
      __ __ __
   A |  |  |  |
     |__|__|__|
   B |  |  |  |
     |__|__|__|
   C |  |  |  |
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
