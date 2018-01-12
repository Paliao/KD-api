class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    @categories = Category.all
    render json: @categories.as_json(include: [:advertises, :combos, :establishments, :events, :products])
  end

  def show
    category_type = @category.category_type
    render json: @category.as_json(include: [category_type])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(
      :name, :description, :type,
      :category_type
    )
  end
end
