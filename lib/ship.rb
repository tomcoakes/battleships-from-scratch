class Ship

  attr_reader :owner

  def initialize(owner)
    @owner = owner
  end

  def register_hit
    @destroyed = true
  end

  def destroyed?
    @destroyed ||= false
  end

end