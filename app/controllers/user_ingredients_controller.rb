class UserIngredientsController < ApplicationController
  def index
    @user_ingredients = current_user.user_ingredients
  end

  def create
    @user_ingredient = UserIngredient.new
    @user_ingredient.ingredient = Ingredient.find(params[:id])
    @user_ingredient.user = current_user

    respond_to do |format|
      if @user_ingredient.save
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end
end
