class Ingredient < ApplicationRecord
  has_many :cocktails, through: :cocktail_ingredients
  has_many :user_ingredients
  has_one_attached :photo

  # include PgSearch::Model
  # multisearchable against: [:name, :spirit]
  include PgSearch::Model
  pg_search_scope :search_by_name_and_spirit,
  against: [:name, :spirit],
  using: {
    tsearch:{
      prefix: true
    }
  }
end
