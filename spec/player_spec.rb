require 'player'

describe Player do
  
  let(:board) {double :board}
  let(:ship) {double :ship}
  let(:shot) {double :shot}
  let(:player) {Player.new(ship)}

  it "creates its own board" do
    expect(player.board.grid).to eq([[:w, :w],
                                     [:w, :w]])
  end

  it "can place ships onto a board" do
    allow(ship).to receive(:include?).and_return(true)
    allow(ship).to receive(:delete)
    expect(player.board).to receive(:add_to_cell).with(0, 0, ship)
    player.place_ship(0, 0, ship)
  end

  it "can only place ships that it still has available" do
    ships = [:patrol_boat]
    player = Player.new(ships)
    expect{player.place_ship(0, 0, :dinghy)}.to raise_error("You don't have any of those boats!")
  end

  xit "can't place a ship twice" do
    ships = [:dinghy]
    player = Player.new(ships)
    player.place_ship(0, 0, :dinghy)
    expect{player.place_ship(0, 1, :dinghy)}.to raise_error("You've already used that boat!")
  end

  it "can take shots at a board" do
    expect(board).to receive(:add_to_cell).with(0, 0, shot)
    player.take_shot(0, 0, shot, board)
  end

  it "begins the game with 5 ships" do
    player = Player.new([ship, ship, ship, ship, ship])
    expect(player.ships.count).to eq(5)
  end

end