class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :presented_by
      t.integer :guests_allowed
      t.integer :capacity
      t.boolean :lock_fields

      t.timestamps
    end
  end
end
