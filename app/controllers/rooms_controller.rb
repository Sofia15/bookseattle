class RoomsController < ApplicationController
  respond_to :json

  def show
    @room = Room.find(1)
  end

  def index
  end

end
