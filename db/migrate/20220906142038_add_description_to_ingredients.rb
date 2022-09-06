class AddDescriptionToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :description, :text
  end
end
