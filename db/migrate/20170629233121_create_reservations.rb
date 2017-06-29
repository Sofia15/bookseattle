class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.boolean :cancelled, default: false, index: true
      t.daterange :reservation_duration, null:false

      t.references :room, null:false
      t.references :account, null:false

      t.timestamps null:false
    end
    add_index :reservations, [:room_id, :reservation_duration], unique: true
    # add_index :reservations, [:room_id, :account_id, :reservation_duration], unique: true
  end
end
