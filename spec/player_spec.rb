require 'player'

describe Player do
  
  let(:board) {double :board}
  let(:ship) {double :ship}
  let(:shot) {double :shot}

  it "creates its own board" do
    player = Player.new(ship)
    expect(player.board.grid).to eq([[:w, :w],
                                     [:w, :w]])
  end

  it "can place ships onto a board" do
    player = Player.new(ship)
    expect(player.board).to receive(:add_to_cell).with(0, 0, ship)
    player.place_ship(0, 0, ship)
  end

  xit "can only place ships that it still has available" do
    ships = [:patrol_boat]
    player = Player.new(ships)
    expect{player.place_ship(0, 0, :dinghy)}.to raise_error("You don't have any of those boats!")
  end

  xit "can't place a ship twice" do
  end

  it "can take shots at a board" do
    player = Player.new(ship)
    expect(board).to receive(:add_to_cell).with(0, 0, shot)
    player.take_shot(0, 0, shot, board)
  end

  it "begins the game with 5 ships" do
    player = Player.new([ship, ship, ship, ship, ship])
    expect(player.ships.count).to eq(5)
  end

end