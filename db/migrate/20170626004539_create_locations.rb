class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name, null: false, limit: 50
      t.text :markdown, null: false
      t.string :timezone, null:false

      t.timestamps null: false

    end
    add_index :locations, :name, unique: true
  end
end
