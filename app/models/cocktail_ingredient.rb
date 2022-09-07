class CocktailIngredient < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  # pg_search_scope :search_by_name_and_recipe,
  #   # against: [ :name, :recipe],
  #   associated_against: {
  #     ingredient: [ :name, :spirit ]
  #   },
  #   using: {
  #     tsearch: { prefix: true } # <-- now `old fash` will return something!
  #   }
end
