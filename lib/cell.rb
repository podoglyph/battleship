require 'pry'

class Cell
  attr_reader :x, :y
  attr_accessor :has_ship, :fired_upon, :captain

  def initialize(x, y)
    @has_ship = false
    @fired_upon = ""
    @captain = nil
    @x = x
    @y = y
  end

end
