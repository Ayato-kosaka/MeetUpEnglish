class AddKanaToPrefectures < ActiveRecord::Migration[5.2]
  def change
    add_column :prefectures, :kana, :string
  end
end
