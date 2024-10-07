class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :destroy]
  before_action :set_reservation, only: [:destroy]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      redirect_to reservations_path, notice: 'Reservation created successfully.'
    else
      render :new
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path, notice: 'Reservation was successfully destroyed.'
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
