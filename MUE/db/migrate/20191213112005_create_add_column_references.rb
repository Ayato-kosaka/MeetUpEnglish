class CreateAddColumnReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :teachers, :city_id
  end
end
