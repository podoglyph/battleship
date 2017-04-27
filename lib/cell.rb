require 'pry'

class Cell
  attr_reader :x, :y, :location
  attr_accessor :has_ship, :fired_upon

  def initialize(x, y, location)
    @has_ship = false
    @fired_upon = ""
    @x = x
    @y = y
    @location = location
  end

end
