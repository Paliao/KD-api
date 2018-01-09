class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :update, :destroy]

  def index
    @parkings = Parking.all

    render json: @parkings
  end

  def show
    render json: @parking
  end

  def create
    @parking = Parking.new(parking_params)

    if @parking.save
      render json: @parking, status: :created, location: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  def update
    if @parking.update(parking_params)
      render json: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @parking.destroy
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end

  def parking_params
    params.require(:parking).permit(
      :quantity, :open_hour, :closure_hour, :hour_price,
      :establishment_id
    )
  end
end
