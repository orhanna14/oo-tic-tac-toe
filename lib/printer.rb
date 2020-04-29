class Printer
  attr_reader :stdout

  def initialize(stdout)
    @stdout = stdout
  end

  def print_welcome_message
    stdout.puts("Enter your move >")
  end

  def print_coordinates_error
    stdout.puts("Invalid input. Please try again.")
  end
end