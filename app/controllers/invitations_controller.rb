class InvitationsController < ApplicationController
  
  def index
    @invitations = Invitation.all
    render json: @invitations
  end

  def create
    invitation = Invitation.create(
      sender_id: params[:id], 
      invitation_token: SecureRandom.uuid, 
      status: 0, 
      email: params[:email]
    )

    if invitation.save
      render json: {status: 200, msg: 'Invitation was created.'}
    end

  end

  def update
    invitation = Invitation.find(params[:id])

    invitation.update(
      status: 0, 
    )

    if user.update(
      sender_id: current_user.id, 
      status: 0, 
      email: params[:email]
    )
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
