class OrangeTree
  attr_accessor :height, :age, :dead, :fruits

  # TODO: Implement all the specs defined in the README.md :)
  def initialize
    @height = 0
    @age = 0
    @dead = false
    @fruits = 0
  end

  def one_year_passes!
    # TODO: age the tree by one year
    @age += 1
    # TODO: check if the tree has survived
    unless dead?
      # TODO: if so, make the tree height grow
      @height += 1 if @age <= 10
      # TODO: if so, make the tree grow fruits
      rotten_fruits_fall!
      @fruits += 100 if (6...10).member?(@age)
      @fruits += 200 if (10...15).member?(@age)
      shoud_tree_die?
    end
  end

  def dead?
    @dead
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits.positive?
  end

  private

  def shoud_tree_die?
    if @age > 50
      death_destiny = []
      death_destiny.push(*Array.new(@age - 50) { true })
      death_destiny.push(*Array.new(100 - @age + 50) { false })
      puts "Death Destiny: #{@age - 50}%"
      @dead = @age == 100 ? true : death_destiny.sample
    end
  end

  def rotten_fruits_fall!
    @fruits = 0
  end
end
