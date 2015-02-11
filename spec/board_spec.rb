require 'board'

describe Board do
  let(:board) {Board.new}
  let(:ship) {double :ship, sunk?: false}
  let(:destroyed_ship) {double :destroyed_ship, sunk?: true}
  let(:shot) {double :shot, is_a?: :Shot}

  it "has a grid" do
    expect(board).to respond_to(:grid)
  end

  it "has a 2x2 grid" do
    expect(board.number_of_cells).to eq(4)
  end

  it "contains only water to begin with" do
    expect(board.grid).to eq([[:w,:w],[:w,:w]])
  end

  it "can add other objects to its cells" do
    board.add_to_cell(1, 0, ship)
    expect(board.grid).to eq([[:w,:w],[ship,:w]])
  end

  it "tells a shot that it was a miss when placed in water" do
    expect(shot).to receive(:register_miss) 
    board.add_to_cell(0, 0, shot)
  end

  it "tells a shot that it was a hit when placed on a ship" do
    board.add_to_cell(1, 0, ship)
    expect(shot).to receive(:register_hit)
    expect(ship).to receive(:hit)
    board.add_to_cell(1, 0, shot)
  end

  it "tells a ship that it was hit" do
    board.add_to_cell(0, 0, ship)
    expect(shot).to receive(:register_hit)
    expect(ship).to receive(:hit)
    board.add_to_cell(0, 0, shot)
  end

  it "knows how many remaining ships are on the board" do
    board.add_to_cell(0, 0, ship)
    expect(board.ships_remaining).to eq(1)
  end

  it "can check that a sunk ship has been sank" do
    expect(board.check_ship_status(destroyed_ship)).to eq("sunk")
  end

  it "can check that a floating ship is still floating" do
    expect(board.check_ship_status(ship)).to eq("floating")
  end

  it "keeps a list of all the ships that have been placed" do
    board.add_to_cell(0, 0, ship)
    expect(board.ships_placed).to eq([ship])
  end

  it "doesn't include shots in the list of ships placed" do
    expect(shot).to receive(:register_miss) 
    board.add_to_cell(0, 1, shot)
    expect(board.ships_placed).to eq([])
  end

  # it "updates the number of remaining ships when a ship is destroyed" do
  #   board.add_to_cell(0, 0, ship)
  #   expect(shot).to receive(:register_hit)
  #   expect(ship).to receive(:hit)
  #   board.add_to_cell(0, 0, shot)
  #   expect(board.ships_remaining).to eq(0)
  # end

end