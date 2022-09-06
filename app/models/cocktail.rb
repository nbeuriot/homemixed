class Cocktail < ApplicationRecord
  has_many :favorites
  has_many :cocktail_ingredients
  has_many :ingredients, through: :cocktail_ingredients
  has_one_attached :photo
end
