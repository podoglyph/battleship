require './lib/grid.rb'
require 'pry'

class Ship
  attr_reader :ship, :hits, :location

  def initialize(location, size, captain)
    @location = location
    @size = size
    @hits = hits
    @captain = captain
  end

  def sunk?
    if hits == size
      return "#{owner}'s #{size}-unit ship is sunk."
    end
  end

  def deploy_ship

  end


end
