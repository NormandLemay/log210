class LivreurController < ApplicationController


  def position
    @livreur = Livreur.find(session[:livreur_id])
  end


  def index
    @livreur = Livreur.find(session[:livreur_id])
    if session[:livreur_id].present?
      @compte_livreur = Livreur.find(session[:livreur_id])
    end
  end

  def liste_commandes
    @livreur = Livreur.find(session[:livreur_id])
    @commandes = Commande.all
    @livreur.coordonnee = params[:coordonnee]
    @commandesPretes = @commandes.select {|commande| commande.status == 'prete'}
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
    @commande = Commande.find_by_id(params[:id])
  end
  private
  def commande_params
    params.require(:livreur).permit(:coordonnee, :nom, :prenom)
  end
end