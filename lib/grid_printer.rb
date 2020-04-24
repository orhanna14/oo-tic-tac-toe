class GridPrinter
  attr_reader :stdout, :grid

  def initialize(stdout, grid)
    @stdout = stdout
    @grid = grid.structure
  end

  def print_grid
    stdout.puts(current_grid)
  end

  def current_grid
    <<~GRID
       1  2  3
       __ __ __
    A |#{grid["A1"]} |#{grid["A2"]} |#{grid["A3"]} |
      |__|__|__|
    B |#{grid["B1"]} |#{grid["B2"]} |#{grid["B3"]} |
      |__|__|__|
    C |#{grid["C1"]} |#{grid["C2"]} |#{grid["C3"]} |
      |__|__|__|
    GRID
  end
end