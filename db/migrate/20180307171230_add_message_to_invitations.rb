class AddMessageToInvitations < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :message, :text
  end
end
