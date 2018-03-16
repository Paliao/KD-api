class CombosController < ApplicationController
  before_action :set_combo, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @combos = Combo.all

    render json: @combos.as_json(include: [:events, :products, :ratings])
  end

  def show
    render json: @combo.as_json(include: [:events, :products, :ratings])
  end

  def create
    @combo = Combo.new(combo_params)
    establishment_id = @combo.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if Category.category_checker(@combo, 'Combo') && @combo.save
        render json: @combo, status: :created, location: @combo
      else
        render json: @combo.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def update
    establishment_id = @combo.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if Category.category_checker(@combo, 'Combo') && @combo.update(combo_params)
        render json: @combo
      else
        render json: @combo.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def destroy
    establishment_id = @combo.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      @combo.destroy
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
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
      product_ids: [], event_ids: [],
      galery_ids: []
    )
  end
end
