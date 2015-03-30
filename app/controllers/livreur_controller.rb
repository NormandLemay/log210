class LivreurController < ApplicationController
  def position
    @livreur = Livreur.find_by(session[:livreur_id])
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
    @commandesPretes = Commande.prete
    if session[:livreur_id].present?
      @compte_livreur = Livreur.find(session[:livreur_id])
      @commandesLivraison = Commande.en_livraison
      @mesCommandes = Commande.en_livraison.where(livreur_id: @compte_livreur.id)
      @commandesLivrer = Commande.livrer
      @mesCommandesCompletees = Commande.livrer.where(livreur_id: @compte_livreur.id)
    end
  end

  def accept
    if session[:livreur_id].present?
      @compte_livreur = Livreur.find(session[:livreur_id])
    end
    @commande = Commande.find_by_id(params[:id])
    redirect_to livreur_index_path
  end

  def termine
    if session[:livreur_id].present?
      @compte_livreur = Livreur.find(session[:livreur_id])
    end
    @commande = Commande.find_by_id(params[:id])
    @commande.passer_etape_suivante
    redirect_to livreur_index_path
  end

  def show
    if session[:livreur_id].present?
      @compte_livreur = Livreur.find(session[:livreur_id])
    end
    @commande = Commande.find_by_id(params[:id])
    @commande.passer_etape_suivante
  end

  private
  def commande_params
    params.require(:livreur).permit(:coordonnee, :nom, :prenom)
  end
end
