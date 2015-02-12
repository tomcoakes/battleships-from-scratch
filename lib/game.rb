class Game

  attr_reader :player1, :player2
  attr_accessor :current_player

  def initialize(players)
    @player1 = players[0]
    @player2 = players[1]
  end

  def shoot(player, y, x, shot)
    did_it_hit = player.take_shot(y, x, shot, opponents_board(player))
    have_they_won = check_if_winner(player)
    whose_turn = switch_player(player) unless self.over?
    return [did_it_hit, have_they_won, whose_turn].compact.join(' ')
  end

  def opponents_board(player)
    players = [player1, player2]
    players.each {|opponent| return opponent.board if opponent != player }
  end

  def check_if_winner(player)
    if opponents_board(player).ships_remaining == 0
      @over = true
      "You've won!"
    end
  end

  def switch_player(player)
    players = [player1, player2]
    players.each {|opponent| @current_player = opponent if opponent != player }
    return "Now it's player one's turn." if current_player == player1
    return "Now it's player two's turn." if current_player == player2
  end

  def over?
    @over ||= false
  end

end