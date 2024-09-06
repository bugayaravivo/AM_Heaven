class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.integer :work_id, null: false
      t.string :name, null: false
      t.text :summary
      t.text :address, null: false
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.decimal :latitude, precision: 10, scale: 6, null: false
      t.timestamps
    end
    # work_id にインデックスを追加
    add_index :spots, :work_id
  end
end
