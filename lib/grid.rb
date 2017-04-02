require './lib/cell.rb'
#require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class Grid

  def initialize
    create
  end

  def create
    #for 4X4 grid
    game_grid = Array.new(4) { Array.new(4, Cell.new) }
    binding.pry
  end
end
g = Grid.new
