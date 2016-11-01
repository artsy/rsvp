class RemoveWaitlistedFromRsvp < ActiveRecord::Migration[5.0]
  def change
    remove_column :rsvps, :waitlisted, :boolean
  end
end
