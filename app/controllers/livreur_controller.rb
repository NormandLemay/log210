class LivreurController < ApplicationController
  @commande = Commande.new
  @compte_livreur
def index

  @commandes = Commande.all

  if session[:livreur_id].present?
    @compte_livreur = Livreur.find(session[:livreur_id])
  end
end


def accept

  redirect_to livreur_accept_path
end

  def show
    if session[:livreur_id].present?
      @compte_livreur = Livreur.find(session[:livreur_id])
    end
    @commande = Commande.find_by(params[:commande])

  end
end