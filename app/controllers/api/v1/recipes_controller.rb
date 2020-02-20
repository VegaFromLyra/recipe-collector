class Api::V1::RecipesController < ApplicationController
  protect_from_forgery

  before_action :validate_recipe
  before_action :validate_steps, only: [:create]

  def create
    head :created
  end

  private

  def render_errors(status:, errors:)
    render status: status, json: { errors: errors.map { |error| error.as_json } }
  end

  def validate_steps
    recipe = params[:recipe]
    return if recipe.present? && recipe[:steps].present?

    error = ApiError.new(
      pointer: "/recipe/steps",
      title: "Missing attribute",
      detail: "Please specify steps to create recipe",
    )

    render_errors(status: 400, errors: [error])
  end

  def validate_recipe
    recipe = params[:recipe]
    return if recipe.present?

    error = ApiError.new(
      pointer: "/recipe",
      title: "Missing attribute",
      detail: "Please specify a recipe",
    )

    render_errors(status: 400, errors: [error])
  end
end
