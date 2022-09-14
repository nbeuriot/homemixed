class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @cocktail = Cocktail.find(params[:id])
    @favorite.cocktail = @cocktail
    if @favorite.save
      redirect_to cocktail_path(@cocktail)
    end
    # respond_to do |format|
    #   format.text { "okay" }
    # end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @cocktail = @favorite.cocktail_id
    @favorite.destroy
    redirect_to cocktail_path(@cocktail)
  end
end
