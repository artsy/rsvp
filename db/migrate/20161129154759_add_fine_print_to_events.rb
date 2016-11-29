class AddFinePrintToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :fine_print, :string
  end
end
