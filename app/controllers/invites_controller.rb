class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @invites = Invite.possible_invites(possible_establishments)

    render json: @invites
  end

  def show
    render json: @invite
  end

  def create
    @invite = Invite.new(invite_params)

    if @invite.save 
      render json: @invite, status: :created, location: @invite
    else
      render json: @invite.errors, status: :unprocessable_entity
    end
  end

  def update
    if @invite.update(invite_params)
      render json: @invite
    else
      render json: @invite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @invite.destroy
  end

  private

  def possible_establishments
    owner_relations = Owner.is_owner?(current_member)
    establishments = []
    owner_relations.each { |relation| establishments << relation.establishment }

    establishments
  end

  def set_invite
    @invite = Invite.find(params[:id])
  end

  def invite_params
    params.require(:invite).permit(
      :description,
      :establishment_id, :user_id
    )
  end
end
