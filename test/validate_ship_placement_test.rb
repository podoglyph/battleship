require './lib/validate_ship_placement.rb'
require 'minitest/autorun'
require 'minitest/pride'

class ValidateShipPlacementTest < Minitest::Test

  def test_class_exists
    v = ValidateShipPlacement.new

    assert_equal ValidateShipPlacement, v.class
  end

  def test_can_receive_return_value_from_validate_on_map
    v = ValidateShipPlacement.new
    vm = v.v_map.parse_coordinates

    assert_equal true, vm
  end

  def test_isolated_validation_gets_values
    v = ValidateShipPlacement.new
    v1 = v.three_ship_coordinates

    assert_equal true, v1
  end

end
