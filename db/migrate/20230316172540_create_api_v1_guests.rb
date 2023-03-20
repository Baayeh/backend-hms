class CreateApiV1Guests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
