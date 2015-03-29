class LivreurController < ApplicationController


  def position
    @livreur = Livreur.find_by(session[:livreur_id])
  end


def index
  @livreur = Livreur.find_by(session[:livreur_id])
  @commandes = Commande.all
  @commandes.each do |commande|
    @commandesPretes = @commandes.select {|commande| commande.status == 'prete'}
  end


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


end