require 'game'

describe Game do

  let(:ship) {double :ship}
  let(:player) {double :player}
  let(:battleships) {Game.new([Player.new(ship), Player.new(ship)])}
  let(:shot) {double :shot}

  it "creates two players when the game is initialized" do
    expect(battleships.player1).to respond_to(:place_ship)
    expect(battleships.player2).to respond_to(:place_ship)
  end

  it "can pass a player's shot to the opponent's board" do
    expect(battleships.player2.board).to receive(:add_to_cell)
    battleships.shoot(battleships.player1, 0, 0, shot)
  end

  it "returns 'You missed!' when a shot misses" do
    allow(battleships.player1.board).to receive(:ships_remaining).and_return(1)
    allow(battleships.player1.board).to receive(:add_to_cell).and_return("You missed!")
    expect(battleships.shoot(battleships.player2, 1, 0, shot)).to eq("You missed! Now it's player one's turn.")
  end

  it "returns 'You hit a ship!' when a shot hits" do
    allow(battleships.player1.board).to receive(:ships_remaining).and_return(1)
    battleships.player1.place_ship(0, 0, ship)
    allow(battleships.player2).to receive(:take_shot).and_return("You hit a ship!")
    expect(battleships.shoot(battleships.player2, 0, 0, shot)).to eq("You hit a ship! Now it's player one's turn.")
    # this isn't doing anything
  end

  it "declares player 1 as the winner when player 2's ships are all sunk" do
    battleships.player2.place_ship(0, 0, ship)
    battleships.shoot(battleships.player1, 0, 0, shot)
    expect(battleships.check_if_winner(battleships.player1)).to eq("You've won!")
    # this isn't doing anything
  end

  it "declares player 2 as the winner when player 1's ships are all sunk" do
    battleships.player1.place_ship(0, 0, ship)
    battleships.shoot(battleships.player2, 0, 0, shot)
    expect(battleships.check_if_winner(battleships.player2)).to eq("You've won!")
    # this isn't doing anything
  end

  it "knows the game hasn't ended whilst both players' ships remain" do
    expect(battleships).not_to be_over
  end

  it "knows the game has ended when a player has no ships left" do
    battleships.player2.place_ship(0, 0, ship)
    battleships.shoot(battleships.player1, 0, 0, shot)
    expect(battleships).to be_over
    # this isn't doing anything
  end

  it "switches to player 1's turn after player 2 takes a shot" do
    allow(battleships.player1.board).to receive(:ships_remaining).and_return(1)
    battleships.player1.place_ship(0, 1, ship)
    battleships.shoot(battleships.player2, 0, 0, shot)
    expect(battleships.current_player).to eq(battleships.player1)
  end

  it "switches to player 2's turn after player 1 takes a shot" do
    allow(battleships.player2.board).to receive(:ships_remaining).and_return(1)
    battleships.player2.place_ship(0, 1, ship)
    battleships.shoot(battleships.player1, 0, 0, shot)
    expect(battleships.current_player).to eq(battleships.player2)
  end

  it "won't switch the player if shot was the final shot of the game" do
    battleships.player1.place_ship(0, 0, ship)
    battleships.shoot(battleships.player2, 0, 0, shot)
    expect(battleships).not_to receive(:switch_player)
    # this isn't doing anything
  end

end