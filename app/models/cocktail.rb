class Cocktail < ApplicationRecord
  has_many :favorites
  has_many :cocktail_ingredients
  has_many :ingredients, through: :cocktail_ingredients
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_recipe,
  against: [:name, :recipe],
  using: {
    tsearch:{
      prefix: true
    }
  }
end
