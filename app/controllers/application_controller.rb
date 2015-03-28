class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session

  def authentification
    if session[:client_id].present?
      @compte_client = Client.find(session[:client_id])
    else
      flash[:error] = 'vous devez être authentifié pour accéder a cette page'
      redirect_to root_path
    end
  end
end
