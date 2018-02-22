class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update]
  before_action :authenticate_user!

  def show
    if Cart.onwer?(current_user.id)
      render json: @cart
    else
      render json: { error: 'This cart does not belongs to you' }, status: :forbidden
    end
  end

  def update
    if Cart.onwer?(current_user.id)
      if @cart.update(cart_params)
        render json: @cart
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'This cart does not belongs to you' }, status: :forbidden
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(
      :total, :count,
      :user_id,
      combo_ids: [], product_ids: []
    )
  end
end
