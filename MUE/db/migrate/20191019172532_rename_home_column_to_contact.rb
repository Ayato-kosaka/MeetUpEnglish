class RenameHomeColumnToContact < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :home_id, :event_id
  end
end
