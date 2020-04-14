class Printer
  attr_reader :stdout, :grid

  def initialize(stdout, grid)
    @stdout = stdout
    @grid = grid
  end

  def print_welcome_message
    stdout.puts(grid.template)
    stdout.puts("Enter your move >")
  end

  def print_coordinates_error
    stdout.puts("Invalid input. Please try again.")
  end

  def print_updated_grid
    stdout.puts(grid.template)
  end
end