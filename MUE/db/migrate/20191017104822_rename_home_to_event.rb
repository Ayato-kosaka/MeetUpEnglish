class RenameHomeToEvent < ActiveRecord::Migration[5.2]
  def change
    rename_table :homes, :events
  end
end
