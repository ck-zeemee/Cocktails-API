# db/seeds.rb

require 'json'

Cocktail.destroy_all
Ingredient.destroy_all

# Load the JSON file
file_path = Rails.root.join('db', 'cocktail_recipes.json')
cocktail_data = JSON.parse(File.read(file_path))

# Iterate over the cocktails and create records
cocktail_data.each do |cocktail|
  new_cocktail = Cocktail.create!(
    name: cocktail['name'],
    category: cocktail['category'],
    container: cocktail['container'],
    instructions: cocktail['instructions'],
    image: cocktail['image']
  )

  # Create associated ingredients
  cocktail['ingredients'].each do |ingredient|
    Ingredient.create!(
      name: ingredient['name'],
      measurement: ingredient['measurement'],
      cocktail_id: new_cocktail.id
    )
  end
end

puts "Seeded #{cocktail_data.size} cocktails successfully!"
