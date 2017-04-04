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
    first_cell, second_cell = [], []
    first_cell = coordinates[0..1].chars #["A", "1"]
    second_cell = coordinates[-2..-1].chars #["B", "1"]
    all_cells = first_cell.concat(second_cell)
  end

  def validate_coordinate_positions?(all_cells, v_range)
    v_range.all?{all_cells}
  end

  def build_validation_range
    v_range = ("A".."D").to_a.concat(("1".."4").to_a)
  end

  # def validate_coordinate_positions?(first_cell, second_cell)
  #   ("A".."D").to_a.include?(first_cell[0])
  #   ("A".."D").to_a.include?(second_cell[0])
  #   ("1".."4").to_a.include?(first_cell[1])
  #   ("1".."4").to_a.include?(second_cell[1])
  # end

  def create_normalized_index
    j = - 1
    rows = ("A".."D").to_a.map {|x| x = j += 1 } #[0, 1, 2, 3]
    columns = (1..4).to_a.map {|x| x -= 1} #[0, 1, 2, 3]
  end

end

g = Grid.new
g.parse_coordinates("A1, E1")
binding.pry
""
