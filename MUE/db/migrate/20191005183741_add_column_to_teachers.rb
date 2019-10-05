class AddColumnToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :activation_digest, :string
    add_column :teachers, :activated, :boolean, default: false
    add_column :teachers, :activated_at, :datetime
    add_column :teachers, :admin, :boolean, default: false
  end
end
