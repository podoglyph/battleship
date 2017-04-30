require 'pry'

class Cell
  attr_reader :location
  attr_accessor :has_ship, :fired_upon

  def initialize(location)
    @has_ship = false
    @fired_upon = ""
    @location = location
  end

end
