class Ingredient < ApplicationRecord
  has_many :cocktails, through: :cocktail_ingredients
  has_many :user_ingredients
end
