class RenameManColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :man, :gender
  end
end
