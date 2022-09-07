class Ingredient < ApplicationRecord
  has_many :cocktails, through: :cocktail_ingredients
  has_many :user_ingredients
  has_one_attached :photo

  include PgSearch::Model
  multisearchable against: [:name, :spirit]
end
