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
    establishment_id = @product.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if Category.category_checker(@product, 'Product') && @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def update
    establishment_id = @product.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if Category.category_checker(@product, 'Product') && @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def destroy
    establishment_id = @product.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      @product.destroy
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
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
