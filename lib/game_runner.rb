class GameRunner
  attr_reader :stdout, :stdin

  def initialize(stdout, stdin)
    @stdout = stdout
    @stdin = stdin
  end

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

  def grid_coordinates
    ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  end

  def welcome_output
    stdout.puts(grid_template)
    stdout.puts("Enter your move >")
  end

  def get_user_input
    coordinate = stdin.gets.chomp
    while !(grid_coordinates.include?(coordinate))
      stdout.puts("Invalid input. Please try again.")
      coordinate = stdin.gets.chomp
    end
  end

  def run
    welcome_output
    get_user_input
  end
end
