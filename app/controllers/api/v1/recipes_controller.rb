class Api::V1::RecipesController < ApplicationController
  protect_from_forgery

  before_action :validate_recipe_presence

  def create
    head :created
  end

  private

  def validate_recipe_presence
    recipe = params[:recipe]
    return if recipe.present?

    error_response = {
      errors: [
        {
          source: { pointer: "/recipe", },
          title: "Please specify a recipe",
          detail: "A top level recipe object is required",
        },
      ],
    }

    render json: error_response, status: 400
  end
end
