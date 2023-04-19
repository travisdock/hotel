class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new(check_in: Date.today, check_out: Date.today + 1)
  end

  # POST /reservations/refresh
  def refresh
    @reservation = Reservation.new(reservation_params)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("new_reservation", partial: "form", locals: { reservation: @reservation }) }
    end
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations/available_rooms
  def available_rooms
    @reservation = Reservation.new(reservation_params)
    @rooms = Room.available_on(@reservation.check_in, @reservation.check_out)
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to @reservation, notice: "Reservation was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: "Reservation was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
    redirect_to reservations_url, notice: "Reservation was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:room_id, :check_in, :check_out)
    end
end
