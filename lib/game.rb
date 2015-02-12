class Game

  attr_reader :player1, :player2

  def initialize
    @player1 = Player.new
    @player2 = Player.new
  end

  def player_shoots(player, y, x, shot)
    player.take_shot(y, x, shot, opponents_board(player))
  end

  def opponents_board(player)
    players = [player1, player2]
    players.each do |opponent|
      return opponent.board if opponent != player
    end
  end

end