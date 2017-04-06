require 'pry'
require 'pry-state'
require './lib/validate_on_map.rb'

class ValidateShipPlacement
  attr_reader :coordinates, :ship_size, :connections, :rules, :v_map

  def initialize(coordinates, ship_size)
    @coordinates = coordinates
    @ship_size = ship_size
    @v_map = ValidateOnMap.new(coordinates, ship_size)
    run
  end

  def isolated_validation(ship_units)
    #ship_units [[0, 0], [1, 0]]
    #[[0, 2], [0, 1]]
    ship_unit_1 = ship_units[0]
    ship_unit_2 = ship_units[1]

    x = ship_unit_1[0] # x = 0
    y = ship_unit_1[1] # y = 2
    #binding.pry
    x1 = ship_unit_2[0]
    y1 = ship_unit_2[1]

    @connections = [[x + 1, y], [x - 1, y], [x, y + 1], [x, y - 1]]

    @rules = connections.reject do |i|
      i.any? {|j| j < 0 || j > 3 }
    end

    if rules.any? {|unit| unit == ship_unit_2}
      puts "It's a valid placement."
      return true
    end
    puts "Not a valid placement."
    false
  end

  def two_ship_coordinates
    #makes sure two_unit_ship is placed on consecutive cells
    #true asks for the coordinates as an array
    @parsed_coordinates = nil
    @parsed_coordinates = @v_map.parse_coordinates(true)
    map_coordinates_to_axes
    isolated_validation(@parsed_coordinates)
  end

  def three_ship_coordinates
    #makes sure three_unit_ship is placed on consecutive cells
    #true asks for the coordinates as an array
    @parsed_coordinates = @v_map.parse_coordinates(true)
    map_coordinates_to_axes
    isolated_validation(@parsed_coordinates)
  end

  def map_coordinates_to_axes
    # parsed_coordinates = [["A", "1"], ["B", "1"], ["B", "2"]]
    rows = ("A".."D").to_a
    columns = ("1".."4").to_a
    @parsed_coordinates.each do |x|
      x[1] = columns.index(x[1])
      x[0] = rows.index(x[0])
    end
    #[[0, 0], [1, 0], [1, 1]]
  end

  def two_ship_on_map
    @v_map.parse_coordinates
    two_ship_coordinates
  end

  def three_ship_on_map
    @v_map.parse_coordinates
    three_ship_coordinates
  end

  def run
    two_ship_on_map if ship_size == 2
    three_ship_on_map if ship_size == 3
  end

end
