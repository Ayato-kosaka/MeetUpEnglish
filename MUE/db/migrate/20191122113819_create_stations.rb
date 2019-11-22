class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :name
      t.decimal :latitude, :precision => 15, :scale => 12
      t.decimal :longitude, :precision => 15, :scale => 12
      
      t.timestamps
    end
  end
end
