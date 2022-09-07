class IngredientsController < ApplicationController
  def index
    # storing all of our spirit type ingredients in @spirits
    @spirits = Ingredient.where(spirit: true)

    # storing all of our non-alcoholic ingredients in @ingredients
    @ingredients = Ingredient.where(spirit: false)
  end
end
