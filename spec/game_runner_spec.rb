require 'spec_helper'
require_relative '../game_runner.rb'

RSpec.describe GameRunner do
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

  describe '#run' do
    it 'on start up, an empty grid is rendered on the screen' do
      stdout = StringIO.new(' ')
      @game_start = GameRunner.new(stdout)

      game = @game_start.run

      expect(game).to eq(grid_template)
    end
  end
end
