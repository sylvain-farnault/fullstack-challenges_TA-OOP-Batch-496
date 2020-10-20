class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(params = {})
    @name = params[:name]
    @price = params[:price]
    @id = params[:id]
  end

end
