require 'ship'

describe Ship do

  let(:ship) {Ship.new(1)}
  let(:large_ship) {Ship.new(2)}

  it "knows its size" do
    expect(ship.size).to eq(1)
  end

  it "should know when it's been hit once" do
    large_ship.hit
    expect(large_ship.hits).to eq(1)
  end

  it "should know when it's been hit twice" do
    large_ship.hit
    large_ship.hit
    expect(large_ship.hits).to eq(2)
  end

  it "should not be sunk when created" do
    expect(ship).not_to be_sunk
  end

  it "will sink if hit enough times" do
    large_ship.hit
    large_ship.hit
    expect(large_ship).to be_sunk
  end


context "Ship sizes" do

  it "knows that a dinghy has a size of 1" do
    dinghy = Ship.dinghy
    expect(dinghy.size).to eq(1)
  end

  it "knows that a patrol boat has a size of 2" do
    patrol_boat = Ship.patrol_boat
    expect(patrol_boat.size).to eq(2)
  end

  it "knows that a destroyer has a size of 3" do
    destroyer = Ship.destroyer
    expect(destroyer.size).to eq(3)
  end

  it "knows that a submarine has a size of 3" do
    submarine = Ship.submarine
    expect(submarine.size).to eq(3)
  end

  it "knows that a battleship has a size of 4" do
    battleship = Ship.battleship
    expect(battleship.size).to eq(4)
  end

  it "knows that an aircraft carrier has a size of 5" do
    aircraft_carrier = Ship.aircraft_carrier
    expect(aircraft_carrier.size).to eq(5)
  end


end


end
