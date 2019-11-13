class AddColumnToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :kana, :string
    add_column :cities, :double, :string
  end
end
