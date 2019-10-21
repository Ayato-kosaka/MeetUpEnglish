class RenameHomeColumnToContact < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :home_id, :event_id
    rename_column :blogs, :blogcategory_id, :category_id
  end
end
