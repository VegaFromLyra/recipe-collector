class Api::V1::RecipesController < ApplicationController
  protect_from_forgery

  def create
    head :created
  end
end
