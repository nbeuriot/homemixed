class IngredientsController < ApplicationController
  def index
    # storing selected popular spirits in @spirits so we can display these in cards
    @spirits = []
    most_popular = ["Rum", "Gin", "Whiskey", "Tequila", "Brandy", "Vodka"]
    ingredient_objects = Ingredient.where(spirit: true)
    ingredient_objects.each do |object|
      if most_popular.include?(object.name)
        @spirits << object.name
      end
    end
  end

  def non_spirits
    # storing all of our non-alcoholic ingredients in @ingredients
    @ingredients = []
    most_popular = ["Soda water", "Ice", "Mint", "Lemon", "Lime",
                    "Syrup", "Sugar", "Salt"]
    ingredient_objects = Ingredient.where(spirit: false)
    ingredient_objects.each do |object|
      if most_popular.include?(object.name)
        @ingredients << object.name
      end
    end
  end
end
