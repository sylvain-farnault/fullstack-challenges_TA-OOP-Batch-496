require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    # Ask user for a name
    name = @view.ask_for('name')
    # Ask user for a description
    description = @view.ask_for('description')
    # Add recipe to the cookbook
    @cookbook.add_recipe(Recipe.new(name, description))
  end

  def destroy
    # Show all recipes to the user
    display_recipes
    # Ask user which one he want to destroy
    index = @view.choose_an_index('destroy')
    # and then destroy it
    @cookbook.remove_recipe(index)
  end


  private

  def display_recipes
    # Get all recipes
    recipes = @cookbook.recipes
    # Ask view to display them
    @view.display(recipes)
  end
end
