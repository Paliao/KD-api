class AdvertisesController < ApplicationController
  before_action :set_advertise, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @advertises = Advertise.all

    render json: @advertises.as_json(include: [:products, :combos, :ratings])
  end

  def show
    render json: @advertise.as_json(include: [:products, :combos, :ratings])
  end

  def create
    @advertise = Advertise.new(advertise_params)
    establishment_id = @advertise.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if Category.category_checker(@advertise, 'Advertise') && @advertise.save
        render json: @advertise, status: :created, location: @advertise
      else
        render json: @advertise.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def update
    establishment_id = @advertise.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if Category.category_checker(@advertise, 'Advertise') && @advertise.update(advertise_params)
        render json: @advertise
      else
        render json: @advertise.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def destroy
    establishment_id = @advertise.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      @advertise.destroy
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  private

  def set_advertise
    @advertise = Advertise.find(params[:id])
  end

  def advertise_params
    params.require(:advertise).permit(
      :name, :price, :disponibility, :description,
      :category_id, :establishment_id,
      product_ids: [], combo_ids: [],
      galery_ids: []
    )
  end
end
