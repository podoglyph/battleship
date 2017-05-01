module Map

  def map(player)
    [top_bottom, location, "\n", row("A", 0, player), "\n", row("B", 1, player), "\n", row("C", 2, player), "\n", row("D", 3, player), top_bottom]
  end

  def row(position, row, player)
    if player == "Player 1"
      "#{position}  #{damage(0, row, player)}  #{damage(1, row, player)}  #{damage(2, row, player)}  #{damage(3, row, player)}"
    else
      "#{position}  #{damage(0, row, player)}  #{damage(1, row, player)}  #{damage(2, row, player)}  #{damage(3, row, player)}"
    end
  end

  def damage(row, column, player)
    if player == "Player 1"
      #do this
    else
      #do this
    end
  end

  def top_bottom
    "=" * 14
  end

  def location
    ".  1  2  3  4  "
  end


end
