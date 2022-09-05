class Cocktail < ApplicationRecord
  has_many :favorites
  has_many :ingredients, through: :cocktail_ingredients

end
