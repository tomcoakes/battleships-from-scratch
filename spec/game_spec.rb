require 'game'

describe Game do

  let(:player) {double :player}
  let(:battleships) {Game.new([Player.new, Player.new])}
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
    battleships.player1.place_ship(0, 0, Ship.dinghy)
    allow(battleships.player1.board).to receive(:add_to_cell).and_return("You missed!")
    expect(battleships.shoot(battleships.player2, 1, 0, shot)).to eq("You missed!")
  end

  it "returns 'You hit a ship!' when a shot misses" do
    battleships.player1.place_ship(0, 0, Ship.dinghy)
    allow(battleships.player2).to receive(:take_shot).and_return("You hit a ship!")
    expect(battleships.shoot(battleships.player2, 0, 0, shot)).to eq("You hit a ship!")
  end

  it "declares player 1 as the winner when player 2's ships are all sunk" do
    battleships.player2.place_ship(0, 0, Ship.dinghy)
    battleships.shoot(battleships.player1, 0, 0, Shot.new)
    expect(battleships.check_if_winner(battleships.player1)).to eq("You've won!")
  end

  it "declares player 2 as the winner when player 1's ships are all sunk" do
    battleships.player1.place_ship(0, 0, Ship.dinghy)
    battleships.shoot(battleships.player2, 0, 0, Shot.new)
    expect(battleships.check_if_winner(battleships.player2)).to eq("You've won!")
  end

  it "knows the game hasn't ended whilst both players' ships remain" do
    expect(battleships).not_to be_over
  end

  it "knows the game has ended when a player has no ships left" do
    battleships.player2.place_ship(0, 0, Ship.dinghy)
    battleships.shoot(battleships.player1, 0, 0, Shot.new)
    expect(battleships).to be_over
  end

  # it "switch to player 1's turn after player 2 takes a shot" do
  #   battleships.player1.place_ship(0, 0, Ship.dinghy)
  #   expect(battleships.shoot(battleships.player2, 0, 1, Shot.new)).to eq("It's now player 1's turn to shoot")
  # end
end