class Ship

  attr_reader :size

  def initialize(size)
    @size = size
    @hits = 0
  end

  def hit
    @hits += 1
  end

  def hits
    @hits
  end

  def sunk?
    hits >= size
  end


  # Class methods

  def self.dinghy
    new(1)
  end

  def self.patrol_boat
    new(2)
  end

  def self.destroyer
    new(3)
  end

  def self.submarine
    new(3)
  end

  def self.battleship
    new(4)
  end

  def self.aircraft_carrier
    new(5)
  end

end