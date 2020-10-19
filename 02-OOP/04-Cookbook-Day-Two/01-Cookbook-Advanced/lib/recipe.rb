class Recipe
  attr_reader :name, :description, :rating
  attr_accessor :done

  def initialize(name, description, rating, done = false)
    @name = name
    @description = description
    @rating = rating
    @done = done
  end
end
