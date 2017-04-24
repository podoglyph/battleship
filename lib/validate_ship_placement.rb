class ValidateShipPlacement
  attr_reader :coordinates, :ship_size

  def initialize(coordinates, ship_size)
    @coordinates = coordinates
    @ship_size = ship_size
  end

  def isolated_validation(ship_units)
    ship_unit_1 = ship_units[0]
    ship_unit_2 = ship_units[1]

    x = ship_unit_1[0]
    y = ship_unit_1[1]

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

end
