class RenameManColumunToTeachers < ActiveRecord::Migration[5.2]
  def change
    rename_column :teachers, :man, :gender
  end
end
