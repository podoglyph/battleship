require './lib/grid.rb'
require './lib/validate_on_map.rb'
require 'pry'
require 'pry-state'

class Computer
  attr_reader :targeted_positions, :two_unit_ships, :three_unit_ships, :unit_1, :unit_2, :unit_3, :x, :y, :x_range, :y_range, :rules, :rules_unit_2

  def initialize
    #@grid = Grid.new
    @targeted_positions = []
    @two_unit_ships = 0
    @three_unit_ships = 0
  end

  def place_ships
    if two_unit_ships < 1
      choose_unit_1
    end
    if three_unit_ships < 1
      choose_unit_1
    end

  end

  def choose_unit_1
    @unit_1 = []
    @x_range = ("A".."D").to_a
    @y_range = ("1".."4").to_a
    x_value = x_range.shuffle.first
    y_value = y_range.shuffle.first
    @x = x_range.index(x_value)
    @y = y_range.index(y_value)
    @unit_1 = [x, y]

    if defined? @comp_two_unit_ship
      return unique_unit_1_check
    end
    select_possible_connections
  end

  def unique_unit_1_check
    if @comp_two_unit_ship.any? { |x| x == @unit_1 }
      return choose_unit_1
    end
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
    @unit_2 = []
    r = Random.new
    max = rules.length - 1
    select_unit_2 = r.rand(max)
    @unit_2 = rules[select_unit_2]

    if defined? @comp_two_unit_ship
      return unique_unit_2_check
    end
    build_two_unit_ship
  end

  def unique_unit_2_check
    if @comp_two_unit_ship.any? { |x| x == @unit_2 }
      return find_unit_2
    end
    find_unit_3_first_or_last
  end

  def build_two_unit_ship
    @two_unit_ships += 1
    @comp_two_unit_ship = unit_1, unit_2
  end

  def find_unit_3_first_or_last
    @unit_3 = Array.new(2)
    if unit_1.first == unit_2.first
      unit_3[0] = unit_1.first
      find_unit_3_last
    end
    if unit_1.last == unit_2.last
      unit_3[1] = unit_1.last
      find_unit_3_first
    end
  end

  def find_unit_3_last
    if unit_2.last == x_range.length - 1
      @unit_3[1] = unit_1.last - 1
    elsif unit_1.last == 0
      @unit_3[1] = unit_2.last + 1
    else
      @unit_3[1] = unit_2.last + 1
    end
    unique_unit_3_check
  end

  def find_unit_3_first
    if unit_2.first == x_range.length - 1
      @unit_3[0] = unit_1.first - 1
    elsif unit_1.first == 0
      @unit_3[0] = unit_2.first + 1
    else
      @unit_3[0] = unit_2.first + 1
    end
    unique_unit_3_check
  end

  def unique_unit_3_check
    if @comp_two_unit_ship.any? { |x| x == @unit_3 }
      return choose_unit_1
    end
    if unit_3 == unit_2 || unit_3 == unit_1
      return choose_unit_1
    end
    build_three_unit_ship
  end

  def build_three_unit_ship
    @three_unit_ships += 1
    @comp_three_unit_ship = unit_1, unit_2, unit_3
  end

end
