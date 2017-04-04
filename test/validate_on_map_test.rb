require 'minitest/autorun'
require 'minitest/pride'
require './lib/validation.rb'

class ValidationTest < Minitest::Test

  def test_class_exists
    v = Validation.new("A1 B1", 2)

    assert_instance_of Validation, v
  end

  def test_first_step_validate_coordinates_on_map
    v = Validation.new("A1 B1", 2)
    validation = v.validate_coordinate_positions?(v.all_cells, v.v_range)

    assert_equal true, validation

    v1 = Validation.new("A7 B1", 2)
    validation1 = v1.validate_coordinate_positions?(v1.all_cells, v1.v_range)

    assert_equal false, validation1
  end

end
