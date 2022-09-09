class CocktailsController < ApplicationController
  def index
    if params[:query].present?
      @cocktails = Cocktail.search_by_name_and_recipe(params[:query])
    else
      @cocktails = Cocktail.all
    end
  end

  def ready_to_make
    # @cocktails = Cocktail.first(5)
    @cocktails = Cocktail.where(name: "Mojito")[0]
  end

  def show
    @cocktail = Cocktail.where(name: "Mojito")[0]
  end
end
