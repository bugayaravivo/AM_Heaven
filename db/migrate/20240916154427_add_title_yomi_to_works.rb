class AddTitleYomiToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :title_yomi, :string
  end
end
