class RemoveDifficultyToCocktails < ActiveRecord::Migration[7.0]
  def change
    remove_column :cocktails, :difficulty, :string
  end
end
