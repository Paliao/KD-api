class AdvertisesController < ApplicationController
  before_action :set_advertise, only: [:show, :update, :destroy]

  def index
    @advertises = Advertise.all

    render json: @advertises
  end

  def show
    render json: @advertise
  end

  def create
    @advertise = Advertise.new(advertise_params)

    if @advertise.save
      render json: @advertise, status: :created, location: @advertise
    else
      render json: @advertise.errors, status: :unprocessable_entity
    end
  end

  def update
    if @advertise.update(advertise_params)
      render json: @advertise
    else
      render json: @advertise.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @advertise.destroy
  end

  private

  def set_advertise
    @advertise = Advertise.find(params[:id])
  end

  def advertise_params
    params.require(:advertise).permit(
      :name, :price, :disponibility, :description, :establishment_id
    )
  end
end
