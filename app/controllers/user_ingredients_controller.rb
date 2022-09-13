class UserIngredientsController < ApplicationController
  def index
    @user_ingredients = current_user.user_ingredients
  end

  def create
    @user_ingredient = UserIngredient.new
    @user_ingredient.ingredient = Ingredient.find(params[:id])
    @user_ingredient.user = current_user

    respond_to do |format|
      if current_user.user_ingredients.find_by(ingredient_id: params[:id]).nil?
        if @user_ingredient.save
          format.turbo_stream
          format.html { redirect_back fallback_location: ingredients_path, notice: "Successfully added ingredient to list" }
          format.json # Follow the classic Rails flow and look for a create.json view,
        else
          format.html { redirect_back fallback_location: ingredients_path, alert: "Something went wrong" }
          format.json # Follow the classic Rails flow and look for a create.json view
        end
      else
        format.html { redirect_back fallback_location: ingredients_path, alert: "relax, you already have #{@user_ingredient.ingredient.name.downcase}" }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end
end
