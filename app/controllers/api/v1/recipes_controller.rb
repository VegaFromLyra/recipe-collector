class Api::V1::RecipesController < ApplicationController
  protect_from_forgery

  before_action :validate_recipe
  before_action :validate_steps, only: [:create]

  def create
    recipe_params = params[:recipe]

    recipe = Recipe.create do |r|
      r.name = recipe_params[:name]
      r.cuisine = recipe_params[:cuisine]
    end

    recipe_errors = recipe.errors.map do |attr, msg|
      ApiError.new(pointer: "/recipe/#{attr}", title: "#{attr} - #{msg}")
    end

    return render_errors(status: 422, errors: recipe_errors) if recipe_errors.present?

    recipe_params[:steps].each do |step_param|
      step = Step.create(recipe_id: recipe.id, text: step_param[:text], order: step_param[:order])
      step_errors = step.errors.map do |attr, msg|
        ApiError.new(pointer: "/recipe/step/#{attr}", title: "#{attr} - #{msg}")
      end

      return render_errors(status: 422, errors: step_errors) if step_errors.present?
    end

    render status: :created, json: recipe.as_json
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
