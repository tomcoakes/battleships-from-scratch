require 'ship'

describe Ship do

  let(:player) {double :player}

  it "is owned by a player" do
    ship = Ship.new(player)
    expect(ship.owner).to eq(player)
  end

  it "can be destroyed" do
    ship = Ship.new(player)
    ship.register_hit
    expect(ship).to be_destroyed
  end

  

end
