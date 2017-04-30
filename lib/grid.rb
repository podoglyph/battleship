require './lib/cell.rb'
require './lib/positions.rb'
require 'pry'

class Grid
  attr_reader :game_grid, :locations

  def initialize
    @game_grid = []
    @locations = Positions.new.valid_coordinates
    create
  end

  def create
    @game_grid = Array.new(4) {Array.new(4)}
    k = -1
    4.times do |i|
      j = - 1
      @game_grid[i].map! do |element|
        j += 1
        k += 1
        element = Cell.new(i, j, locations[k])
      end
    end
  end

end
