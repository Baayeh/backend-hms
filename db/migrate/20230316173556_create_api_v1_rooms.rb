class CreateApiV1Rooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.string :room_type
      t.string :room_desc
      t.string :room_img
      t.string :beds
      t.integer :room_max_guests
      t.integer :room_size
      t.decimal :room_price
      t.boolean :booked, :default => false

      t.timestamps
    end
  end
end
