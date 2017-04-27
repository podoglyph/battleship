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
  end

  def place_ships(ship_size)
    place_your_ships_message
    input = gets.chomp.upcase
    if verify_coordinates?(input)
      player_first_cell(self, input, ship_size)
      place_your_second_ship_message
    else
      place_ship_on_map_message
    end
  end

end
