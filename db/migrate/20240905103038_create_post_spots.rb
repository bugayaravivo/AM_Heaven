class CreatePostSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :post_spots do |t|
      t.integer :post_id, null: false
      t.integer :spot_id, null: false
      t.timestamps
    end
      # インデックスを追加
    add_index :post_spots, :post_id
    add_index :post_spots, :spot_id
    add_index :post_spots, [:post_id, :spot_id], unique: true
  end
end
