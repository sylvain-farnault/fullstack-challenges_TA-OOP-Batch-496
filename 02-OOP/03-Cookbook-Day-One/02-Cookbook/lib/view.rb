class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "[#{index + 1}] #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_for(item)
    printf "#{item.capitalize} recipe: "
    gets.chomp
  end

  def choose_an_index(action)
    printf "Which one do you want to #{action}? : "
    gets.chomp.to_i - 1
  end
end
