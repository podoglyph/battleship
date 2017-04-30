require './test/test_helper.rb'
require './lib/validator.rb'

class ValidatorTest < Minitest::Test

  def test_it_exists
    v = Validator.new

    assert_instance_of Validator, v
  end
end
