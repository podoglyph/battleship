class Messages

  def self.welcome
    "Welcome to BATTLESHIP, Would you like to (p)lay, read the (i)nstructions, or (q)uit? >"
  end

  def self.instructions
    puts "To play the game...do all this stuff."
  end

  def self.quit
    puts "Goodbye."
    exit
  end
end
