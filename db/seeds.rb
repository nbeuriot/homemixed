# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def check_ingredient(ingredient)
  puts "-- Looking for #{ingredient}"
  #If ingredient already exist on DB, find it otherwise create it
  if Ingredient.find_by(name: ingredient).nil?
    puts "--- Creating #{ingredient}"
    url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?i=#{ingredient}"
    ingredient_info__serialized = URI.open(url).read
    ingredient_info = JSON.parse(ingredient_info__serialized)
    ingredient_info["ingredients"][0]["strAlcohol"] == 'Yes' ? alcohol = true : alcohol = false
    ps = PragmaticSegmenter::Segmenter.new(text: ingredient_info["ingredients"][0]["strDescription"])
    desc = "#{ps.segment[0]} #{ps.segment[1]} #{ps.segment[2]}"
    new_ingredient = Ingredient.create(name: ingredient, spirit: alcohol, description: desc)
    file = "app/assets/images/ingredients/#{ingredient}.jpg"
    if File.exist?(file)
      file = File.open(file)
      puts "Files exist"
      new_ingredient.photo.attach(io: file, filename: File.basename(file), content_type: "image/jpeg")
    end
    new_ingredient.save
    return new_ingredient
  else
    puts "--- #{ingredient} already present"
    ingredient = Ingredient.find_by(name: ingredient)
    return ingredient
  end
end


def add_cocktails(cocktail)
  puts "================================="
  puts "Searching for #{cocktail}"
  url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail}"
  cocktail_info_serialized = URI.open(url).read
  cocktail_info = JSON.parse(cocktail_info_serialized)
  if cocktail_info["drinks"].nil?
    puts "Didn't find it"
  else
    new_cocktail = Cocktail.create(name: cocktail_info["drinks"][0]["strDrink"],
                                   recipe: cocktail_info["drinks"][0]["strInstructions"],
                                   category: cocktail_info["drinks"][0]["strIBA"])
    puts "- Adding pictures"
    file = File.open("app/assets/images/cocktails/#{cocktail}.jpg")
    new_cocktail.photo.attach(io: file, filename: File.basename(file), content_type: "image/jpeg")
    new_cocktail.save
    p new_cocktail

    (1..15).each do |index|
      ing = cocktail_info["drinks"][0]["strIngredient#{index}"]
      if ing.nil?
        break
      else
        # p check_ingredient(ing)
        ingredient = check_ingredient(ing)
        CocktailIngredient.create(cocktail: new_cocktail, ingredient: ingredient)

      end
    end
  end
end



puts "Create some users"
users_list = ["nico", "spencer", "marcus", "preston"]

users_list.each do |user|
  puts "#{user}@homemixed.club"
  user_to_create = User.create(email: "#{user}@homemixed.club", password: "123456", username: user, dob: "07/07/1972".to_date)
  user_to_create.save
end

ingredients = ["Rum", "Gin", "Whiskey", "Tequila", "Brandy", "Vodka"]

ingredients.each do |ingredient|
  check_ingredient(ingredient)
end

puts "Create some Cocktails"

cocktails = ["cosmopolitan", "margarita", "Mojito", "Old Fashioned", "Bloody Mary", "Manhattan", "Caipirinha", "Mai Tai", "Tequila Sunrise", "Pina Colada", "Irish Coffee", "Rum and Coke", "Sangria", "Screwdriver", "Espresso Martini", "Aperol Spritz", "French 75", "Paloma", "Brandon and Will's Coke Float"  ]

cocktails.each do |cocktail|
  add_cocktails(cocktail)
end
