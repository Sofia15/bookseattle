class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false, limit: 50
      t.text :markdown, null: false
      t.text :html, null:false
      t.references :location, null:false

      t.timestamps null: false
    end
  end
end
