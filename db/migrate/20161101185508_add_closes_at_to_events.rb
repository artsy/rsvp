class AddClosesAtToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :closes_at, :datetime, null: false
  end
end
