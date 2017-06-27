class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name, null: false, presence: true, length: {minimum: 3, maximum: 50}

      t.timestamps

    end
    add_index :locations, :name, unique: true
  end
end
