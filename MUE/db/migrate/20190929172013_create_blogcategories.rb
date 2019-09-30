class CreateBlogcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :blogcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
