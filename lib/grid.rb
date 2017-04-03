require './lib/cell.rb'
#require './lib/required_files.rb'
require 'pry'
require 'pry-state'

class Grid
  attr_reader :game_grid

  def initialize
    @game_grid = []
    create
  end

  def create
    @game_grid = Array.new(4) {Array.new(4)}
    4.times do |i|
      j = 0
      @game_grid[i].map! do |element|
        j += 1
        element = Cell.new(i + 1, j)
      end
    end
  end

  def parse_coordinates(coordinates)
    first_cell = coordinates[0..1].chars
    second_cell = coordinates[-2..-1].chars
    #ex: ["A", "1"] ["B", "1"]
  end

  def create_normalized_index
    j = - 1
    rows = ("A".."D").to_a.map! {|x| x = j += 1 } #[0, 1, 2, 3]
    columns = (1..4).to_a.map! {|x| x -= 1} #[0, 1, 2, 3]
  end

end
