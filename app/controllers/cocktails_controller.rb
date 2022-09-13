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
    # @cocktails = Cocktail.where(name: "Mojito")
    puts "=================================================="
    puts "|                Cocktail Finder                 |"
    puts "=================================================="
    puts " "
    result = []
    users_ingredients = current_user.ingredients
    cocktails = Cocktail.all

    cocktails.each do |cocktail|
      puts " +++++ Looking for #{cocktail.name} ++++++"
      count = 0
      cocktail.ingredients.each do |cocktail_ing|
        users_ingredients.each do |user_ing|
          if cocktail_ing == user_ing
            puts "       -- You have #{cocktail_ing.name}"
            count += + 1
          end
        end
      end
      result << cocktail if cocktail.ingredients.size <= count
      puts " "
      puts " "
    end
    puts "**** So you can make ****"
    result.each do |c|
      puts "  -- #{c.name}"
    end
    @cocktails = result
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @favorite = Favorite.new
  end
end
