class CreateRoomRates < ActiveRecord::Migration[5.1]
  def change
    create_table :room_rates do |t|
      t.decimal :rate, default: 0, precision:10, scale: 2, null:false
      t.daterange :rate_duration, null:false

      t.references :room, null:false
      t.timestamps null: false
    end
    add_index :room_rates, [:room_id, :rate_duration], unique: true
  end
end
