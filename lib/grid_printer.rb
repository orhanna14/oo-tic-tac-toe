class GridPrinter
  attr_reader :coordinates, :stdout, :grid

  def initialize(stdout, grid)
    @stdout = stdout
    @grid = grid
  end

  def print_grid(coordinates)
    stdout.puts(print_current_grid(coordinates))
  end

  def print_current_grid(coordinates)
    <<~GRID
       1  2  3
       __ __ __
    A |#{coordinates["A1"]} |#{coordinates["A2"]} |#{coordinates["A3"]} |
      |__|__|__|
    B |#{coordinates["B1"]} |#{coordinates["B2"]} |#{coordinates["B3"]} |
      |__|__|__|
    C |#{coordinates["C1"]} |#{coordinates["C2"]} |#{coordinates["C3"]} |
      |__|__|__|
    GRID
  end
end