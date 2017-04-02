#require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class Cell
  attr_reader :has_ship, :hit_count
  def initialize
    @has_ship = false
    @hit_count = 0
  end

  
end
