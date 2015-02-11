class Player

  def place_ship(y, x, ship, board)
    board.add_to_cell(y, x, ship)
  end

end