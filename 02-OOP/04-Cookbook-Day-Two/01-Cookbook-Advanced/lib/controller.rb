require_relative 'view'
require_relative 'scrape_marmiton_service'
require 'nokogiri'
require 'open-uri'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display(@cookbook.recipes, true)
  end

  def create
    # Ask user for a name
    name = @view.ask_for('name')
    # Ask user for a description
    description = @view.ask_for('description')
    # Ask for rating
    rating = @view.ask_for('rating')
    # Add recipe to the cookbook
    @cookbook.add_recipe(Recipe.new(name, description, rating))
  end

  def destroy
    # Show all recipes to the user
    @view.display(@cookbook.recipes)
    # Ask user which one he want to destroy
    index = @view.choose_an_index('destroy')
    # and then destroy it
    @cookbook.remove_recipe(index)
  end

  def importe_from_internet
    # Ask user what he his looking for
    ingredient = @view.ask_for('ingredient')
    # Get results from Internet
    recipes_found = ScrapeMarmitonService.new(ingredient).call
    # Display results
    @view.display(recipes_found)
    # Ask user to choose en recipe
    index = @view.choose_an_index('add in your cookbook')
    # Add recipe to the cookbook
    @cookbook.add_recipe(recipes_found[index])
  end

  def mark_as_done
    # Show all recipes to the user
    @view.display(@cookbook.recipes, true)
    # Ask user which one he want to mark as done
    index = @view.choose_an_index('mark as done')
    # Change "done" value for selected recipe
    @cookbook.toggle_done(index)
  end

  private

  def display(recipes)
    # Get all recipes
    # recipes = @cookbook.recipes
    # Ask view to display them
    @view.display(recipes)
  end

  def scrape(item)
    # results will be an array of recipe instances
    results = []
    #  ...
    url = "https://www.marmiton.org/recettes/recherche.aspx?aqt=#{item}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    doc.search('.recipe-card').first(5).each do |element|
      name = element.search('.recipe-card__title').text.strip
      description = element.search('.recipe-card__description').text.strip
      rating = element.search('.recipe-card__rating__value').text.strip
      results.push(Recipe.new(name, description, rating))
    end
    results
  end
end
