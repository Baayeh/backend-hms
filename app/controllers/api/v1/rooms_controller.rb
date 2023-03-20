class Api::V1::RoomsController < ApplicationController
  before_action :set_room, only: %i[ show update destroy ]

  # GET /api/v1/rooms
  def index
    @rooms = Room.all
    render json: @rooms, status: :ok
  end

  # GET /api/v1/rooms/1
  def show
    render json: @room
  end

  # POST /api/v1/rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      render json: {
        data: @room,
        message: 'Room created successfully'
      }, status: :created
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/rooms/1
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/rooms/1
  def destroy
    @room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:room_number, :room_type, :room_desc, :room_img, :room_max_guests, :room_size, :room_price, :beds)
    end
end
