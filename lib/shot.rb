class Shot

  def hit?
    @hit
  end

  def register_hit
    @hit = true
    "You hit a ship!"
  end

  def register_miss
    @hit = false
    "You missed!"
  end

end