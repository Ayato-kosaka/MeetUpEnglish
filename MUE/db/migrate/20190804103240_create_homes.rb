class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.integer :cityId
      t.date :date
      t.time :start
      t.time :end
      t.integer :peopleNum
      t.integer :teacherId
      t.integer :cafeId

      t.timestamps
    end
  end
end
