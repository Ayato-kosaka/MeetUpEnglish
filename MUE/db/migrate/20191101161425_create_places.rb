class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :en_name
      t.string :ja_name
      t.string :placeId
      t.string :website
      t.decimal :latitude, :precision => 15, :scale => 12
      t.decimal :longitude, :precision => 15, :scale => 12

      t.timestamps
    end
  end
end
