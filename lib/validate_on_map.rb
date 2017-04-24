require './lib/messages.rb'
require 'pry'

module ValidateOnMap
  include Messages

  def verify_coordinates?(input)
    parse(input).all? { |x| grid_range.include?(x)}
  end

  def parse(input)
    input.chars.delete_if {|x| x == " "}
  end

  def grid_range
    ("A".."D").to_a.concat(("1".."4").to_a)
  end

end
