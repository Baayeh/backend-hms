class Api::V1::BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show update destroy ]

  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def show
    render json: @booking
  end

  def create

    if Room.where(id: booking_params[:room_id]).exists?
      room = Room.find(booking_params[:room_id])
      
      # Create a new booking object using the booking_params and the found room
      booking = Booking.new(
        guest_id: booking_params[:guest_id],
        room_id: room.id,
        check_in_date: booking_params[:check_in_date],
        check_out_date: booking_params[:check_out_date],
      )

      if !room.booked
        # If the room is not booked, try to save the booking
        if booking.save
          room.update(booked: true)
          render json: {
            data: booking,
            message: 'Room booked successfully for guest'
          }, status: :created
        else
          render json: {
            message: "Room was not booked because:",
            errors: booking.errors.full_messages
          }, status: :unprocessable_entity
        end
      else
        # If the room is already booked, check if the booking is valid
        if booking.valid?
          if booking.save
            # If the booking is successful, mark the room as booked, and return a success message
            room.update(booked: true)
            render json: {
              data: booking,
              message: "Room booked for guest successfully"
            }, status: :created
          else
            render json: {
              message: "Room was not booked because:",
              errors: booking.errors.full_messages
            }, status: :unprocessable_entity
          end
        else
          # If the booking is not valid, return an error message saying the room is not available
          render json: {
            message: "Room is not available",
            errors: booking.errors.full_messages
          }, status: :unprocessable_entity
        end
      end
      
    else
      render json: {
        message: 'Please select a room'
      }, status: :not_found
    end


    
  end

  # PATCH/PUT /api/v1/bookings/1
  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/bookings/1
  def destroy
    @booking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:check_in_date, :check_out_date, :room_id, :guest_id)
    end
end
