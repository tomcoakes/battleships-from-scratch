require 'board'

describe Board do
  let(:board) {Board.new}

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
    ship = double :ship
    board.add_to_cell(1, 0, ship)
    expect(board.grid).to eq([[:w,:w],[ship,:w]])
  end

end