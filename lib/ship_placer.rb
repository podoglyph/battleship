module ShipPlacer

  def mark_ship_on_grid(ship, grid)
    grid.game_grid.each do |cell|
      if cell.location == ship[0]
        cell.has_ship = true
      end

      if cell.location == ship[1]
        cell.has_ship = true
      end
    end
  end

end
