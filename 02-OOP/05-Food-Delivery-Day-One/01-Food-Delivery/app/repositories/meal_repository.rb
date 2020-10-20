class MealRepository

  def initialize(params ={})
    @csv = params[:csv]
    @next_id = 1
    @meals = load_csv
  end

  def add(name, price, id)
    args = {
      name: name,
      price: price,
      id: id
    }
    @meals << Meal.new(args)
  end

  def all
    @meals
  end

  def find(id)
    @meals[id]
  end

  private

  def load_csv

  end
end
