class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title,    null: false
      t.text :body,       null: false
      t.text :address    
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
