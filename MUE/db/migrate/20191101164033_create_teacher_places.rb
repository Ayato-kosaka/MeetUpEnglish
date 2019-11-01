class CreateTeacherPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_places do |t|
      t.references :teacher, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
