class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @parkings = Parking.all

    render json: @parkings.as_json(include: [:ratings])
  end

  def show
    render json: @parking.as_json(include: [:ratings])
  end

  def create
    @parking = Parking.new(parking_params)
    establishment_id = @parking.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if @parking.save
        render json: @parking, status: :created, location: @parking
      else
        render json: @parking.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def update
    establishment_id = @parking.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if @parking.update(parking_params)
        render json: @parking
      else
        render json: @parking.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def destroy
    establishment_id = @parking.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      @parking.destroy
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end

  def parking_params
    params.require(:parking).permit(
      :quantity, :open_hour, :closure_hour, :hour_price,
      :establishment_id,
      galery_ids: []
    )
  end
end
