class CreatePrefectureLines < ActiveRecord::Migration[5.2]
  def change
    create_table :prefecture_lines do |t|
      t.references :prefectre, foreign_key: true
      t.references :line, foreign_key: true

      t.timestamps
    end
  end
end
