require './lib/validate_ship_placement.rb'
require 'minitest/autorun'
require 'minitest/pride'

class ValidateShipPlacementTest < Minitest::Test

  def test_class_exists
    v = ValidateShipPlacement

    assert_equal ValidateShipPlacement, v
  end

  def test_can_receive_return_value_from_validate_on_map
    v = ValidateShipPlacement
    vm = ValidateOnMap.parse_coordinates("A1, B1", 2)

    assert_equal true, vm

    vm1 = ValidateOnMap.parse_coordinates("A1, B6", 2)
    assert_equal false, vm1
  end

  def test_isolated_validation_gets_values
    v = ValidateShipPlacement.new
    v1 = v.three_ship_coordinates(coordinates = "A1 B1 B2", ship_size = 3)

    assert_equal [[0, 0], [1, 0], [1, 1]], v1
  end

end
