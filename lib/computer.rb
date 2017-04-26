require './lib/ship.rb'
require './lib/validate_ship_placement.rb'
require 'pry'

class Computer
  include ValidateShipPlacement
  attr_reader :computer_grid, :grid_positions, :two_unit_ship, :three_unit_ship

  def initialize
    @total_ships = 0
    @name = "Computer"
    @grid_positions = Grid.new.game_grid
  end

  def place_ships(ship_size)
    if ship_size == 2
      @two_unit_ship = computer_first_cell(self, ship_size)
    else
      @three_unit_ship = computer_first_cell(self, ship_size)
    end
  end



end

# c = Computer.new
# binding.pry
# ""
