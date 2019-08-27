class AddIndexToSection < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :index, :integer
  end
end
