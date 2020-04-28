class GridPrinter
  attr_reader :stdout, :grid

  def initialize(stdout, grid)
    @stdout = stdout
    @grid = grid
  end

  def print_grid
    stdout.puts(replace_template_with_value_from_grid)
  end

  def replace_template_with_value_from_grid
   grid_template_model_mustache.gsub(/[A-C][1-3]/) { |cell| grid.get_value(cell) }
  end

  def grid_template_model_mustache
    <<~GRID
        1  2  3
       __ __ __
    A |A1 |A2 |A3 |
      |__|__|__|
    B |B1 |B2 |B3 |
      |__|__|__|
    C |C1 |C2 |C3 |
      |__|__|__|
    GRID
  end
end