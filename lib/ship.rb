require './lib/grid.rb'

class Ship
  attr_reader :ship, :hits, :location, :name

  def initialize(location, size, name)
    @location = location
    @size = size
    @hits = hits
    @name = name
  end

  def sunk?
    if hits == size
      return "#{name}'s #{size}-unit ship is sunk."
    end
  end

  def deploy_ship

  end


end
