class AddCategoryToCocktails < ActiveRecord::Migration[7.0]
  def change
    add_column :cocktails, :category, :string
  end
end
