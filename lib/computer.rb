require './lib/grid.rb'
require './lib/validate_on_map.rb'
require 'pry'
require 'pry-state'

class Computer
  attr_reader :targeted_positions, :two_unit_ships, :three_unit_ships, :unit_1, :unit_2, :x, :y, :x_range, :y_range, :rules

  def initialize
    #@grid = Grid.new
    @targeted_positions = []
    @two_unit_ships = 0
    @three_unit_ships = 0
    @comp_two_unit_ship = Array.new(2)
  end

  def place_ships
    if two_unit_ships < 1
      choose_unit_1
    end
    # if three_unit_ships < 1
    #   place_three_unit_ship
    # end
    #handoff to player
  end

  def choose_unit_1
    @x_range = ("A".."D").to_a
    @y_range = ("1".."4").to_a
    x_value = x_range.shuffle.first
    y_value = y_range.shuffle.first
    @x = x_range.index(x_value)
    @y = y_range.index(y_value)
    @unit_1 = []
    @unit_1 = [x, y]
    select_possible_connections
  end

  def select_possible_connections
    unit_1
    connections = [[x + 1, y], [x - 1, y], [x, y + 1], [x, y - 1]]

    @rules = connections.reject do |i|
      i.any? {|j| j < 0 || j > 3 }
    end
    find_unit_2
  end

  def find_unit_2
    r = Random.new
    max = rules.length - 1
    select_unit_2 = r.rand(max)
    @unit_2 = []
    @unit_2 = rules[select_unit_2]
    build_two_unit_ship
  end

  def build_two_unit_ship
    @two_unit_ships += 1
    @comp_two_unit_ship = unit_1.concat(unit_2).each_slice(2).to_a
  end

end
c = Computer.new
c.place_ships
