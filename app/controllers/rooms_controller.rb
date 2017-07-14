class RoomsController < ApplicationController

  def show
    r = Room.arel_table
    room = Room.find_by!(r[:name].matches params[:id])
    respond_with room
  end

  def index
    rooms = Room.all
    respond_with rooms
  end

end
