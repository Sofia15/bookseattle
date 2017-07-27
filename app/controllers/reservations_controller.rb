class ReservationsController < ApplicationController
  def show
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
  rescue PG::UniqueViolation
    render json: {errors: ['The room is not available']}
  # rescue ActiveRecord::StatementInvalid
  #   render json: {errors: ['You can\'t check-out before you check-in']}
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
      .permit(:check_in, :check_out, :guest_count, :room_id)
  end
end
