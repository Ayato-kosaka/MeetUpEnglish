class CreateBlogcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :blogcomments do |t|
      t.string :name
      t.text :text
      t.integer :blogId

      t.timestamps
    end
  end
end
