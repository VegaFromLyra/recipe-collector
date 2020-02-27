class Api::V1::RecipesController < ApplicationController
  protect_from_forgery

  before_action :validate_recipe, only: [:create]
  before_action :validate_steps, only: [:create]

  def index
    all_recipes = Recipe.all.map { |recipe| recipe.as_json }
    render status: :ok, json: all_recipes
  end

  def create
    recipe_params = params[:recipe]

    recipe = Recipe.create do |r|
      r.name = recipe_params[:name]
      r.cuisine = recipe_params[:cuisine]
    end

    recipe_errors = collect_errors(model: recipe, pointer_prefix: "/recipe")
    return render_errors(status: 422, errors: recipe_errors) if recipe_errors.present?

    steps = recipe_params[:steps].map do |step_param|
      Step.create(recipe_id: recipe.id, text: step_param[:text], order: step_param[:order])
    end

    step_errors = steps.map do |step|
      collect_errors(model: step, pointer_prefix: "/recipe/step")
    end.flatten

    return render_errors(status: 422, errors: step_errors) if step_errors.present?

    render status: :created, json: recipe.as_json
  end

  private

  def collect_errors(model:, pointer_prefix:)
    model.errors.map do |attr, msg|
      ApiError.new(pointer: "#{pointer_prefix}/#{attr}", title: "#{attr} - #{msg}")
    end
  end

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
