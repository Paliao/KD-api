class CombosController < ApplicationController
  before_action :set_combo, only: [:show, :update, :destroy]

  def index
    @combos = Combo.all

    render json: @combos
  end

  def show
    render json: @combo
  end

  def create
    @combo = Combo.new(combo_params)

    if @combo.save
      render json: @combo, status: :created, location: @combo
    else
      render json: @combo.errors, status: :unprocessable_entity
    end
  end

  def update
    if @combo.update(combo_params)
      render json: @combo
    else
      render json: @combo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @combo.destroy
  end

  private

  def set_combo
    @combo = Combo.find(params[:id])
  end

  def combo_params
    params.require(:combo).permit(
      :name, :price, :category,
      :day_id, :establishment_id, product_ids: []
    )
  end
end
