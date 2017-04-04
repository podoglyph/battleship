require 'pry'
require 'pry-state'
require './lib/validate_on_map.rb'

class ValidateShipPlacement

  def two_ship_on_map(coordinates = "A1 B2", ship_size = 2)
     if ValidateOnMap.parse_coordinates(coordinates, ship_size)
       return true
     end
     false
  end

  def three_ship_on_map(coordinates = "A1 B1 B2", ship_size = 3)
     if ValidateOnMap.parse_coordinates(coordinates, ship_size)
       return true
     end
     false
  end

  def two_ship_coordinates(coordinates = "A1 B2", ship_size = 2)
    #makes sure two_unit_ship is placed on consecutive cells

  end

  def three_ship_coordinates(coordinates = "A1 B1 B2", ship_size = 3)
    #makes sure three_unit_ship is placed on consecutive cells

  end

end
