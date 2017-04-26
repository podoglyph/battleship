require './lib/required_files.rb'
require './lib/validate_ship_placement.rb'
require './lib/validate_on_map.rb'
require 'pry'

class Player
  include ValidateShipPlacement
  include ValidateOnMap
  include Messages

  def initialize
    @total_ships = 0
    @name = "Computer"
    @grid_positions = Grid.new.game_grid
    @two_unit_ship =
  end

  def place_ships(ship_size)
    place_your_ships_message
    placement = gets.chomp.upcase
    if verify_coordinates?(placement)
      #continue
    else
      place_ship_on_map_message
      place_ships(ship_size)
    end
  end

end
