class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.boolean :cancelled, default: false, index: true
      t.tsrange :reservation_duration, null:false
      t.decimal :total_price, default: 0, precision:10, scale: 2, null:false

      t.references :room, null:false
      t.integer :guest_count, null: false
      t.timestamps null:false
    end
    add_index :reservations, [:room_id, :reservation_duration], unique: true
    # add_index :reservations, [:room_id, :account_id, :reservation_duration], unique: true
  end
end
