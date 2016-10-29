class ChangeGuestsFieldToArray < ActiveRecord::Migration[5.0]
  def change
    change_column :rsvps, :guests, :string, array: true, default: [], using: "(string_to_array(guests, ','))"
  end
end
