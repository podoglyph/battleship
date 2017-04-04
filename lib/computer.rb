require './lib/grid.rb'
require 'pry'
require 'pry-state'

class Computer
  attr_reader :targeted_positions, :two_unit_ships, :three_unit_ships

  def initialize
    @grid = Grid.new
    @targeted_positions = []
    @two_unit_ships = 0
    @three_unit_ships = 0
    run
  end

  def place_ships

  end
  

  def run
    place_ships
  end

end
