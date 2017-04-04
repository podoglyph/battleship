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
    ts_coordinates = "A1 B1"
    ship_size = 2
    # Validation(ts_coordinates, ship_size)
    # Validation.validate_coordinate_positions?(all_cells, v_range)
    # binding.pry
  end

  def run
    #place_ships
    two_ship_placement
  end

end
c = Computer.new
