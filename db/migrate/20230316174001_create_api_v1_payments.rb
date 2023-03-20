class CreateApiV1Payments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :payment_method
      t.decimal :total_amount
      t.date :payment_date
      t.string :cheque_number
      t.string :momo_number
      t.string :transaction_id
      t.string :entity
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
