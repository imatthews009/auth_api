class AddSenderEmailToInvitation < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :sender_email, :string
  end
end
