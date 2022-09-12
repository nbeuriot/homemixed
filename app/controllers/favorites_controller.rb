class FavoritesController < ApplicationController
  def index
    @favorites = current_user.all_favorites
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(params[:id])
    @favorite.user = current_user
    @cocktail = Cocktail.find(params[:id])
    @favorite.cocktail = @cocktail
    if @favorite.save
      redirect_to favorites_path, notice: "Cocktial saved to favorites"
    else
      redirect_to cocktail_path(@cocktail)
    end
  end
end
