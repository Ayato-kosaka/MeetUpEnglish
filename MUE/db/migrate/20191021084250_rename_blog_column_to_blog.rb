class RenameBlogColumnToBlog < ActiveRecord::Migration[5.2]
  def change
    rename_column :blogs, :category_id, :blogcategory_id
  end
end
