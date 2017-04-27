require './lib/cell.rb'
require 'pry'

class Grid
  attr_reader :game_grid, :locations

  def initialize
    @game_grid = []
    @locations = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
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
