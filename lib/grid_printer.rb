class GridPrinter
  attr_reader :stdout, :grid

  def initialize(stdout, grid)
    @stdout = stdout
    @grid = grid
  end

  def print_grid
    stdout.puts(grid.current_grid)
  end
end