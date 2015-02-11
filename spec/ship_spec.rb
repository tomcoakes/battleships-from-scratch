require 'ship'

describe Ship do

  let(:dinghy) {Ship.dinghy}
  let(:patrol_boat) {Ship.patrol_boat}

  it "knows its size" do
    expect(dinghy.size).to eq(1)
  end

  it "should know when it's been hit once" do
    patrol_boat.hit
    expect(patrol_boat.hits).to eq(1)
  end

  it "should know when it's been hit twice" do
    patrol_boat.hit
    patrol_boat.hit
    expect(patrol_boat.hits).to eq(2)
  end

  it "should not be sunk when created" do
    expect(dinghy).not_to be_sunk
  end

  it "will sink if hit enough times" do
    patrol_boat.hit
    patrol_boat.hit
    expect(patrol_boat).to be_sunk
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
