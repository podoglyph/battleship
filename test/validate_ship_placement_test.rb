require './test/test_helper.rb'
require './lib/validate_ship_placement.rb'

class ValidateShipPlacementTest < Minitest::Test

  def test_class_exists
    v = ValidateShipPlacement.new("A1 B1", 2)

    assert_equal ValidateShipPlacement, v.class
  end

  def test_can_receive_return_value_from_validate_on_map
    v = ValidateShipPlacement.new("A1 B1", 2)
    vm = v.v_map.parse_coordinates

    assert_equal true, vm
  end

  def test_isolated_validation_gets_values
    v = ValidateShipPlacement.new("A1 B1", 2)
    v1 = v.three_ship_coordinates

    assert_equal true, v1
  end

end
