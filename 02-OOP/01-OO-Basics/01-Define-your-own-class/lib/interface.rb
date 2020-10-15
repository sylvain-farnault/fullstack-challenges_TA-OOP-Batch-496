require_relative 'restaurant'

chez_paulo = Restaurant.new("Chez Paulo", "Marseille", 2)
le_petit_nice = Restaurant.new("Le Petit Nice", "Marseille Malmousque", 5)

puts le_petit_nice.infos
puts chez_paulo.infos
puts chez_paulo.open?
puts chez_paulo.close

puts chez_paulo.open?
