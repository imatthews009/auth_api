class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :invitation_token
      t.integer :status

      t.timestamps
    end
  end
end
