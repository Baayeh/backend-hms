class Api::V1::PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show update destroy ]

  # GET /api/v1/payments
  def index
    @payments = Payment.all

    render json: @payments
  end

  # GET /api/v1/payments/1
  def show
    render json: @payment
  end

  # POST /api/v1/payments
  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      render json: {
        message: 'Payment was made successfully',
        data: @payment
      }, status: :created
    else
      render json: {
        message: 'Payment was not successful',
        errors: @payment.errors
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/payments/1
  def update
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/payments/1
  def destroy
    @payment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:payment_method, :total_amount, :payment_date, :booking_id, :cheque_number, :momo_number, :transaction_id)
    end
end
