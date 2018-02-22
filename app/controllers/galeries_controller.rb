class GaleriesController < ApplicationController
  before_action :set_galery, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @galeries = Galery.all

    render json: @galeries
  end

  def show
    render json: @galery
  end

  def create
    @galery = Galery.new(galery_params)

    if @galery.save
      render json: @galery, status: :created, location: @galery
    else
      render json: @galery.errors, status: :unprocessable_entity
    end
  end

  def update
    if @galery.update(galery_params)
      render json: @galery
    else
      render json: @galery.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @galery.destroy
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
