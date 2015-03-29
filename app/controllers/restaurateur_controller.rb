class RestaurateurController < ActionController::Base
  before_filter :authentification, :except => [:new, :create]
  layout 'restaurateur'
  def index
    @restaurants = @restaurateur.restaurants
  end

  def preparer_commande
    @restaurants = @restaurateur.restaurants
  end

  def passer_etape_suivante
    @commande = Commande.find_by_id(params[:id])
    @commande.passer_etape_suivante
    redirect_to restaurateur_preparer_commande_path
  end

  def gerer_livreur
    redirect_to livreurs_path
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
