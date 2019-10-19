class AddRememberDigestToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :remember_digest, :string
  end
end
