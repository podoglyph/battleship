#require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class Cell
  attr_reader :has_ship, :fired_upon, :x, :y

  def initialize
    @has_ship = false
    @fired_upon = nil
    @x = x
    @y = y
  end

end
