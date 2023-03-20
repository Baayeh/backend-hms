class Api::V1::GuestsController < ApplicationController
  before_action :set_guest, only: %i[ show update destroy ]

  # GET /api/v1/guests
  def index
    @guests = Guest.all

    render json: @guests
  end

  # GET /api/v1/guests/1
  def show
    render json: @guest
  end

  # POST /api/v1/guests
  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      render json: {
        data: @guest,
        message: "Guest created successfully"
      }, status: :created
    else
      render json: {
        message: "Guest was not added because:",
        errors: @guest.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/guests/1
  def update
    if @guest.update(guest_params)
      render json: @guest
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/guests/1
  def destroy
    @guest.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.require(:guest).permit(:f_name, :l_name, :email, :phone_number)
    end
end
