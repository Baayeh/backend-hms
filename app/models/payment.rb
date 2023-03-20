class Payment < ApplicationRecord
  belongs_to :booking

  validates :total_amount, :payment_method, :payment_date, presence: true

  with_options if: :payment_method_cheque? do |payment|
    payment.validates :cheque_number, presence: true
  end

  with_options if: :payment_method_momo? do |payment|
    payment.validates :momo_number, :transaction_id, presence: true
  end

  with_options if: :payment_method_pos? do |payment|
    payment.validates :transaction_id, presence: true
  end

  PAYMENT_METHODS = %w[cheque momo pos]

  PAYMENT_METHODS.each do |method|
    define_method "payment_method_#{method}?" do
      self.payment_method == method
    end
  end
end
