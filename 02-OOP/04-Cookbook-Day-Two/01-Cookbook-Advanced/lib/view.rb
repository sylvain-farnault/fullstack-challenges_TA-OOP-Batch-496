class View
  def display(recipes, display_done = false)
    done = ""
    recipes.each_with_index do |recipe, index|
      done = recipe.done ? "[x]" : "[ ]" if display_done
      puts "[#{index + 1}]#{done} #{recipe.name} (#{recipe.rating}/5)"
    end
  end

  def ask_for(item)
    printf "Recipe #{item}: "
    gets.chomp
  end

  def choose_an_index(action)
    printf "Which one do you want to #{action}? : "
    gets.chomp.to_i - 1
  end
end
