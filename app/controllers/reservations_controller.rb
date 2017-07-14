class ReservationsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
  end

  def create
    reservation = Reservation.create(munged_params)
    if reservation.valid?
      respond_with(reservation)
    else
      render json: {errors: reservation.errors.full_messages}
    end
  end

  def update
  end

  private

  def munged_params
    duped = reservation_params.dup
    check_in = duped.delete(:checkin).try(:to_date)
    check_out = duped.delete(:checkout).try(:to_date)
    duped[:reservation_duration] = check_in..check_out
    duped
  end

  def reservation_params
    params.require(:reservation)
      .permit(:checkin, :checkout, :guest_count, :room_id)
  end
end
