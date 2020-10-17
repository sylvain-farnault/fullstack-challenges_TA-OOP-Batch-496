require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :recipes

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_recipes_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
    save_recipes_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_recipes_csv
  end



  private

  def load_recipes_csv
    # csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    CSV.foreach(@csv_file_path) do |row|
      @recipes.push(Recipe.new(row[0], row[1]))
    end
  end

  def save_recipes_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
