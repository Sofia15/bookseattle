class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false, limit: 50
      t.text :markdown, null: false
      t.text :html, null:false
      t.references :location, null:false
      t.decimal :weekend_rate, default: 0, precision:10, scale: 2, null:false
      t.decimal :weekday_rate, default: 0, precision:10, scale: 2, null:false

      t.timestamps null: false
    end
  end
end
