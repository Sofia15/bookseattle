class CreateBookedRates < ActiveRecord::Migration[5.1]
  def change
    create_table :booked_rates do |t|

      t.references :room, null:false
      t.references :reservation, null:false

      t.timestamps null:false
    end

  end
end
