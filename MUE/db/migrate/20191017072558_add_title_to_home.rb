class AddTitleToHome < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :title, :string
    add_column :homes, :fee, :integer
    add_column :homes, :finished, :boolean, default: false
  end
end
