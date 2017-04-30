class Positions
  attr_reader :letters, :numbers, :valid_coordinates

  def initialize
    @letters = ('A'..'D').to_a
    @numbers = (1..4).to_a
    combine_positions
  end

  def combine_positions
    @valid_coordinates = []
    @numbers = numbers_to_string
    letters.map do |x|
      numbers.each do |y|
        @valid_coordinates << x + y
      end
    end
  end

  def numbers_to_string
    numbers.map! {|x| x.to_s}
  end

end
