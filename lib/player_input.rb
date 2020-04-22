class PlayerInput
  attr_reader :stdin
  attr_accessor :player_choice
  
  def initialize(stdin)
    @stdin = stdin
    @coordinates = coordinates
  end

  def assign_to_player
    if valid_coordinate?
      @player_choice = choice
    end
  end

  def valid_coordinate?
    coordinates.include?(get_coordinate)
  end

  def get_coordinate
    choice = stdin.gets.chomp
  end

  private

  def coordinates
     ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  end
end