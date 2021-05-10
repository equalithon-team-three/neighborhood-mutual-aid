class Api::PostCategoriesController < ApplicationController
  def index
    @post_categories = PostCategory.all
    render json: @post_categories
  end
end
