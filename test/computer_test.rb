require './test/test_helper.rb'
require './lib/required_files.rb'

class ComputerTest < Minitest::Test

  def test_class_exists
    c = Computer.new

    assert_equal Computer, c.class
  end


end
