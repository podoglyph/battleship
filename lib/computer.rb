require './lib/grid.rb'
require './lib/validation.rb'
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

  def two_ship_placement
    coordinates = "A1 B9"
    ship_size = 2
    v = Validation.parse_coordinates(coordinates, ship_size)
  end

  def run
    #place_ships
    two_ship_placement
  end

end
