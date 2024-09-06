class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :work_id
      t.integer :spot_id
      t.string :title
      t.text :body
      t.integer :rating, null: false
      t.timestamps
    end
    # インデックスを追加
    add_index :reviews, :user_id
    add_index :reviews, :work_id
    add_index :reviews, :spot_id
  end
end
