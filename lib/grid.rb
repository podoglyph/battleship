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
    @locations.map do |x|
      @game_grid << Cell.new(x)
    end
  end

end
