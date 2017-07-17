class ApplicationController < ActionController::API
    respond_to :json
  # protect_from_forgery with: :exception
  def health
    render nothing: true
  end
end
