class AccueilController < ApplicationController
  include AccueilHelper

  def index
    @restaurant = Restaurant.joins(:menus).distinct
    if session[:client_id].present?
      @compte_client = Client.find(session[:client_id])
    end
  end

  def deconnexion
    reset_session
    redirect_to accueil_index_path
  end

  def connexion
    compte = Compte.find_by_courriel_and_mot_de_passe(params[:courriel],
                                                      params[:mot_de_passe])
    if compte.present? && compte.client_id.present?
      session[:client_id] = compte.client_id
      redirect_to accueil_index_path
    elsif compte.present? && compte.restaurateur_id.present?
      session[:restaurateur_id] = compte.restaurateur_id
      redirect_to restaurateur_index_path
    elsif compte.present? && compte.livreur_id.present?
      session[:livreur_id] = compte.livreur_id
    redirect_to livreurs_path #provisoir; je vais devoir ajouter un path ici
    end
  end
end
