class Player

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def place_ship(y, x, ship)
    board.add_to_cell(y, x, ship)
  end

  def take_shot(y, x, shot, board)
    board.add_to_cell(y, x, shot)
  end

end