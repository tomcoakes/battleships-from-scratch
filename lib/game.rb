class Game

  attr_reader :player1, :player2

  def initialize
    @player1 = Player.new
    @player2 = Player.new
  end

  def player_shoots(player, y, x, shot)
    did_it_hit = player.take_shot(y, x, shot, opponents_board(player))
    have_they_won = check_if_winner(player)
    shot_feedback = [did_it_hit, have_they_won].compact.join(' ')
  end

  def opponents_board(player)
    players = [player1, player2]
    players.each {|opponent| return opponent.board if opponent != player }
  end

  def check_if_winner(player)
    if opponents_board(player).ships_remaining == 0
      "You've won!"
    end
  end

end