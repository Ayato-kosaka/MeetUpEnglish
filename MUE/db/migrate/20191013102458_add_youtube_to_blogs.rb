class AddYoutubeToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :youtube, :boolean
  end
end
