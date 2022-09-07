class CocktailsController < ApplicationController
  def index
    if params[:query].present?
      @cocktails = Cocktail.search_by_name_and_recipe(params[:query])
    else
      @cocktails = Cocktail.all
    end
  end

  def show
  end
end
