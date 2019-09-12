class CreateBlogcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :blogcomments do |t|
      t.belongs_to :blog
      t.string :name
      t.text :text
      t.integer :blogId
      t.integer :test

      t.timestamps
    end
  end
end
