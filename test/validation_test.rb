require 'minitest/autorun'
require 'minitest/pride'
require './lib/validation.rb'

class ValidationTest < Minitest::Test

  def test_class_exists
    v = Validation.new

    assert_instance_of Validation, v
  end

end
