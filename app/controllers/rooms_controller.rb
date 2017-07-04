class RoomsController < ApplicationController

  def show
    room = Room.find(params[:id])
    respond_with room
  end

  def index
    rooms = Room.all
    respond_with rooms
  end

end
