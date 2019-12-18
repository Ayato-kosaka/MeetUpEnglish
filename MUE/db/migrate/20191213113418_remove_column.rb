class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :teachers, :city_id
    remove_reference :teachers, :city_id
  end
end
