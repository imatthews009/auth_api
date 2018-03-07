class AddViewedAtToInvitation < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :viewed_at, :datetime
  end
end
