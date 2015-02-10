require 'shot'

describe Shot do
  it "has a hit state that can be set to true" do
    shot = Shot.new
    shot.register_hit
    expect(shot.hit?).to eq(true)
  end

  it "has a hit state that can be set to false" do
    shot = Shot.new
    shot.register_miss
    expect(shot.hit?).to eq(false)
  end
end