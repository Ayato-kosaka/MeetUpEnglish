class AddBlogidToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :blogId, :integer
  end
end
