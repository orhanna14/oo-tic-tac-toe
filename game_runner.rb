class GameRunner
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
    @stdout = stdout ||= StringIO.new(' ')
  end

  def run
    @stdout.puts(grid_template)
    @stdout.string
  end
end
