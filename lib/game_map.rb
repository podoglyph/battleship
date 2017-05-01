require './lib/map.rb'

class GameMap
  include Map

  def print_map(player)
    puts map(player)
  end

end
