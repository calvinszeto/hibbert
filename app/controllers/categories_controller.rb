class CategoriesController < ApplicationController

  # GET /categories
  def index
		@categories = Category.all
  end
end
