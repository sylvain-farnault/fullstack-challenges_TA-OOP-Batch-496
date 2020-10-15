class Restaurant
  attr_accessor :name

  def initialize(name, address, stars, open = true)
    @name = name
    @address = address
    @stars = stars
    @open = open
  end

  def infos
    "#{@name}, #{@address}, #{@stars} étoiles."
  end

  def open?
    @open
  end

  def close
    @open = false
    "#{@name} is closing..."
  end
end
