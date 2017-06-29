class CreateRoomRates < ActiveRecord::Migration[5.1]
  def change
    create_table :room_rates do |t|
      t.decimal :rate, default: 0, precision:10, scale: 2, null:false
      t.daterange :duration, null:false

      t.references :room, null:false
      t.timestamps null: false
    end
  end
end
