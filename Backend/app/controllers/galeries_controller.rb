class GaleriesController < ApplicationController
  before_action :set_galery, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @galeries = Galery.all

    render json: @galeries
  end

  def show
    render json: @galery
  end

  def create
    @galery = Galery.new(galery_params)
    establishment_id = @galery.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if @galery.save
        render json: @galery, status: :created, location: @galery
      else
        render json: @galery.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def update
    establishment_id = @galery.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if @galery.update(galery_params)
        render json: @galery
      else
        render json: @galery.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def destroy
    establishment_id = @galery.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      @galery.destroy
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  private

  def set_galery
    @galery = Galery.find(params[:id])
  end

  def galery_params
    params.require(:galery).permit(
      :url, :type,
      :advertise_id, :combo_id,
      :establishment_id, :event_id,
      :parking_id, :product_id
    )
  end
end
