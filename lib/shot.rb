class Shot

  def hit?
    @hit
  end

  def register_hit
    @hit = true
  end

  def register_miss
    @hit = false
  end

end