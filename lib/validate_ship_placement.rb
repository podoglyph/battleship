require 'pry'
require 'pry-state'
require './lib/validate_on_map.rb'

class ValidateShipPlacement

  def two_ship_on_map(coordinates = "A1 B2", ship_size = 2)
    ValidateOnMap.parse_coordinates(coordinates, ship_size)

  end

  def three_ship_on_map(coordinates = "A1 B1 B2", ship_size = 3)
    ValidateOnMap.parse_coordinates(coordinates, ship_size)
  end

  def two_ship_coordinates(coordinates = "A1 B2", ship_size = 2)
    #makes sure two_unit_ship is placed on consecutive cells
    #true asks for the coordinates as an array
    ValidateOnMap.parse_coordinates(coordinates, ship_size, true)

    puts "Lemonade"
  end

  def three_ship_coordinates(coordinates = "A1 B1 B2", ship_size = 3)
    #makes sure three_unit_ship is placed on consecutive cells
    #true asks for the coordinates as an array
    ValidateOnMap.parse_coordinates(coordinates, ship_size, true)


  end

  def map_coordinates_to_axes
    rows = ("A".."D").to_a
    columns = ("1".."4").to_a
    collected_coordinates = [["A", "1"], ["B", "1"], ["B", "2"]]
    norm_coordinates = collected_coordinates.each do |x|
      x[1] = columns.index(x[1])
      x[0] = rows.index(x[0])
    end
    #[[0, 0], [1, 0], [1, 1]]
  end

  # def create_grid_index
  #   rows = ("A".."D").to_a
  #   j = - 1
  #   normalized_rows = rows.map {|x| x = j += 1 } #[0, 1, 2, 3]
  #   columns = (1..4).to_a
  #   normalized_columns = columns.map {|x| x -= 1} #[0, 1, 2, 3]
  # end

end
