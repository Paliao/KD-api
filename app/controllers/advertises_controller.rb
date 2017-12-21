class AdvertisesController < ApplicationController
  before_action :set_advertise, only: [:show, :update, :destroy]

  # GET /advertises
  def index
    @advertises = Advertise.all

    render json: @advertises
  end

  # GET /advertises/1
  def show
    render json: @advertise
  end

  # POST /advertises
  def create
    @advertise = Advertise.new(advertise_params)

    if @advertise.save
      render json: @advertise, status: :created, location: @advertise
    else
      render json: @advertise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /advertises/1
  def update
    if @advertise.update(advertise_params)
      render json: @advertise
    else
      render json: @advertise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /advertises/1
  def destroy
    @advertise.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertise
      @advertise = Advertise.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def advertise_params
      params.require(:advertise).permit(:name, :price, :rating, :disponibility, :description, :establishment_id)
    end
end
