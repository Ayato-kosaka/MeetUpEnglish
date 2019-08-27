class AddUrlToCafe < ActiveRecord::Migration[5.2]
  def change
    add_column :caves, :url, :text
  end
end
