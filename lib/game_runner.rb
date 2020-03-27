class GameRunner
  attr_reader :stdout, :stdin

  def initialize(stdout, stdin)
    @stdout = stdout
    @stdin = stdin
  end

  def run
    print_welcome_message
    demand_valid_coordinates
  end

  private

  def print_welcome_message
    stdout.puts(grid_template)
    stdout.puts("Enter your move >")
  end

  def demand_valid_coordinates
    while coordinates_invalid?
      print_coordinates_error
    end
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

  def coordinates_invalid?
    !grid_coordinates.include?(get_user_input)
  end

  def print_coordinates_error
    stdout.puts("Invalid input. Please try again.")
  end

  def grid_coordinates
    ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  end

  def get_user_input
    stdin.gets.chomp
  end

end
