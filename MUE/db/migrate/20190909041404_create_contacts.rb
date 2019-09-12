class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :title
      t.text :message
      t.boolean :checked, default: false
      t.references :home, foreign_key: true

      t.timestamps
    end
  end
end
