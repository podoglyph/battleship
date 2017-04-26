require './lib/ship.rb'
require './lib/validate_ship_placement.rb'
require 'pry'

class Computer
  include ValidateShipPlacement
  attr_reader :computer_grid, :grid_positions

  def initialize
    @total_ships = 0
    @name = "Computer"
    @grid_positions = Grid.new.game_grid
  end

  def place_ships(ship_size)
    position_ship(self, ship_size)
  end



end

# c = Computer.new
# binding.pry
# ""
