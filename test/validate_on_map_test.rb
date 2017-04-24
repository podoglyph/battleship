require './test/test_helper.rb'
require './lib/validate_on_map.rb'

class ValidateOnMapTest < Minitest::Test

  def test_class_exists
    v = ValidateOnMap.new("A1 B1", 2)

    assert_instance_of ValidateOnMap, v
  end

  def test_first_step_validate_coordinates_on_map
    coordinates = "A1 B1"
    ship_size = 2

    v = ValidateOnMap.new(coordinates, ship_size)

    v.parse_coordinates(indices = false)

    validation = v.validate_coordinate_positions?

    assert_equal true, validation

    coordinates2 = "A7 B1"
    v1 = ValidateOnMap.new(coordinates2, ship_size)

    v1.parse_coordinates(indices = false)

    validation1 = v1.validate_coordinate_positions?

    assert_equal false, validation1
  end

end
