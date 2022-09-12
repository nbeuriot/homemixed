class FavoritesController < ApplicationController
  def index
    @favorites = current_user.all_favorites
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @cocktail = Cocktail.find(params[:id])
    @favorite.cocktail = @cocktail
    @favorite.save
  end
end
