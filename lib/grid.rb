require './lib/cell.rb'
require 'pry'

class Grid
  attr_reader :game_grid

  def initialize
    @game_grid = []
    create
  end

  def create
    @game_grid = Array.new(4) {Array.new(4)}
    4.times do |i|
      j = - 1
      @game_grid[i].map! do |element|
        j += 1
        element = Cell.new(i, j)
      end
    end
  end


end
