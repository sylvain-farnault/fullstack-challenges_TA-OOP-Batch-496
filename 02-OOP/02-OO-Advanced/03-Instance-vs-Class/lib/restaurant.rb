class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :city, :name, :average_rating

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @average_rating = 0
    @nb_rates = 0
  end

  # TODO: implement .filter_by_city and #rate methods

  def self.filter_by_city(restaurants, city)
    answer = []
    restaurants.each do |restaurant|
      answer.push(restaurant) if restaurant.city == city
    end
    answer
  end

  def rate(rate)
    @average_rating = (@average_rating * @nb_rates + rate).to_f / (@nb_rates + 1)
    @nb_rates += 1
  end
end


jules_verne = Restaurant.new("paris", "Jules Verne")
bluebird = Restaurant.new("london", "Bluebird")
daniel = Restaurant.new("new york", "Daniel")
restaurants = [jules_verne, bluebird, daniel]
p result = Restaurant.filter_by_city(restaurants, "paris")[0]
result.rate(4)
p result
result.rate(5)
p result
