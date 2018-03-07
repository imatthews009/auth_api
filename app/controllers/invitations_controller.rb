class InvitationsController < ApplicationController
  
  def index
    @invitations = Invitation.all
    render json: @invitations
  end

  def create
    @invitation = Invitation.create(
      sender_id: params[:id], 
      invitation_token: SecureRandom.uuid, 
      status: 0, 
      email: params[:email],
      message: params[:message],
      sender_email: params[:sender_email]
    )

    if @invitation.save
      render json: @invitation
    end

  end

  def update
    invitation = Invitation.find(params[:id])
    if invitation.update(status: params[:status], viewed_at: Time.now)
      render json: { status: 200, msg: 'Invitation details have been updated.' }
    end
  end

  def destroy
    invitation = Invitation.find(params[:id])
    if invitation.destroy
      render json: { status: 200, msg: 'Invitation has been deleted.' }
    end
  end
end
