class AdvertisesController < ApplicationController
  before_action :set_advertise, only: [:show, :update, :destroy]

  def index
    @advertises = Advertise.all

    render json: @advertises.as_json(include: [:products, :combos, :ratings])
  end

  def show
    render json: @advertise.as_json(include: [:products, :combos, :ratings])
  end

  def create
    @advertise = Advertise.new(advertise_params)

    if @advertise.save && Category.category_checker(@advertise, 'Advertise')
      render json: @advertise, status: :created, location: @advertise
    else
      render json: @advertise.errors, status: :unprocessable_entity
    end
  end

  def update
    if @advertise.update(advertise_params) && Category.category_checker(@advertise, 'Advertise')
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
      :name, :price, :disponibility, :description,
      :category_id, :establishment_id,
      product_ids: [], combos: []
    )
  end
end
