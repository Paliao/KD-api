class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @contacts = Contact.all

    render json: @contacts
  end

  def show
    render json: @contact
  end

  def create
    @contact = Contact.new(contact_params)
    establishment_id = @contact.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if @contact.save
        render json: @contact, status: :created, location: @contact
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def update
    establishment_id = @contact.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      if @contact.update(contact_params)
        render json: @contact
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  def destroy
    establishment_id = @contact.establishment_id

    if Establishment.staff?(establishment_id, current_user)
      @contact.destroy
    else
      render json: { error: 'You does not have permission to finish this action' }, status: :forbidden
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(
      :phone, :cellphone,
      :establishment_id
    )
  end
end
