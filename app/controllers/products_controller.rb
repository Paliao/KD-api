class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @products = Product.all

    render json: @products.as_json(include: [:days, :combos, :ratings])
  end

  def show
    render json: @product.as_json(include: [:days, :combos, :ratings])
  end

  def create
    @product = Product.new(product_params)

    if @product.save && Category.category_checker(@product, 'Product')
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params) && Category.category_checker(@product, 'Product')
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :price, :description, :quantity,
      :category_id,
      :establishment_id, :combo_id, :event_id,
      day_ids: []
    )
  end
end
