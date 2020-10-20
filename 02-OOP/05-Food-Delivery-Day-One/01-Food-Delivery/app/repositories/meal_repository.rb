require_relative '../models/meal'
require 'csv'

class MealRepository

  attr_writer :meals

  def initialize(csv)
    @csv = csv
    @next_id = 1
    @meals = []
    load_csv
  end

  def create(meal)
    # args = {
    #   id: params[:id],
    #   name: params[:name],
    #   price: params[:price]
    # }
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private

  def load_csv
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    if File.file?(@csv)
      CSV.foreach(@csv, csv_options) do |row|
        done = row[3] == "true"
        args = {
          id: row['id'].to_i,
          name: row['name'],
          price: row['price'].to_i
        }
        @meals.push(Meal.new(args))
      end
      @next_id = @meals.count + 1
    end
  end

  def save_csv
    CSV.open(@csv, 'wb') do |csv|
      csv << ['id','name','price']
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end


# repo = MealRepository.new('data/meals.csv')
# p repo
# puts ""
# r = repo.meals.select { |meal| meal.id == 1 }
# p r
