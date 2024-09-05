class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :title, null: false
      t.string :genre, null: false
      t.text :summary
      t.timestamps
    end
  end
end
