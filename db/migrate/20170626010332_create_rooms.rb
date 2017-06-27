class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false, presence: true, length: {minimum: 3, maximum: 50}
      t.references :location, null:false

      t.timestamps
    end
  end
end
