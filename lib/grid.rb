require './lib/cell.rb'
#require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class Grid

  def initialize
    create
  end

  def create
    game_grid = Array.new(4) {Array.new(4)}
    4.times do |i|
      game_grid[i].map! do |x|
        x = Cell.new
      end
    end
  end
end
