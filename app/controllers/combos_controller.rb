class CombosController < ApplicationController
  before_action :set_combo, only: [:show, :update, :destroy]

  def index
    @combos = Combo.all

    render json: @combos.as_json(include: [:events, :products])
  end

  def show
    render json: @combo.as_json(include: [:events, :products])
  end

  def create
    @combo = Combo.new(combo_params)

    if @combo.save && Category.category_checker(@combo, 'Combo')
      render json: @combo, status: :created, location: @combo
    else
      render json: @combo.errors, status: :unprocessable_entity
    end
  end

  def update
    if @combo.update(combo_params) && Category.category_checker(@combo, 'Combo')
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
      :name, :price,
      :category_id,
      :day_id, :establishment_id,
      product_ids: [], event_ids: []
    )
  end
end
