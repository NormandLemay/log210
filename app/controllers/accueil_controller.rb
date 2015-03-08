class AccueilController < ApplicationController
  include AccueilHelper

  def index
    @restaurant = Restaurant.joins(:menus).distinct
    if session[:client_id].present?
    	@compte_client = Client.find(session[:client_id])
    end
  end

  def deconnexion
  	session.delete :client_id
  	@compte_client = nil
  	redirect_to accueil_index_path
  end

  def connexion
  	compte = Compte.find_by_courriel_and_mot_de_passe(params[:courriel], params[:mot_de_passe])
  	if compte.present?
  		session[:client_id] = compte.client_id
  	end
  	redirect_to accueil_index_path
  end

end
