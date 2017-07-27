class ReservationsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
  end

  def create
    reservation = Reservation.new(munged_params)
    if reservation.save
      respond_with(reservation)
    else
      render json: {errors: reservation.errors.full_messages}
    end
  rescue ArgumentError
    render json: {errors: ['Both check-in and check-out are required.']}

  # rescue ActiveRecord::StatementInvalid
  #   render json: {errors: ['You can\'t check-out before you check-in']}
  end

  def update
  end

  private

  def munged_params
    duped = reservation_params.dup
    check_in = duped.delete(:check_in).try(:to_date)
    check_out = duped.delete(:check_out).try(:to_date)
    duped[:reservation_duration] = check_in...check_out
    duped
  end

  def reservation_params
    params.require(:reservation)
      .permit(:checkin, :checkout, :guest_count, :room_id)
  end
end
