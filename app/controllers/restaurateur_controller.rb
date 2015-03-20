class RestaurateurController < ActionController::Base
  before_filter :authentification
layout 'restaurateur'
  def index
    @restaurants = @restaurateur.restaurants
  end

  def preparer_commande
  end

  def gerer_livreur
  end

  def deconnexion
    reset_session
    redirect_to root_path
  end

  protected

    def authentification
      if session[:restaurateur_id].present?
        @restaurateur = Restaurateur.find(session[:restaurateur_id])
      else
        flash[:error] = 'vous devez être authentifier pour accéder a cette page'
        redirect_to root_path
      end
    end
end
