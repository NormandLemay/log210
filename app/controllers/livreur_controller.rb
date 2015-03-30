class LivreurController < ApplicationController
  before_filter :set_livreur, except: [:position]

  def position
    @livreur = Livreur.find_by(session[:livreur_id])
  end

  def index
    @livreur = Livreur.find(session[:livreur_id])
  end

  def liste_commandes
    @livreur = Livreur.find(session[:livreur_id])
    @commandes = Commande.all
    @livreur.coordonnee = params[:coordonnee]
    @commandes_pretes = Commande.prete
    @mes_commandes = Commande.en_livraison.where(livreur_id: @compte_livreur.id)
    @mes_commandes_completees = Commande.livrer.where(livreur_id: @compte_livreur.id)
  end

  def accept
    @commande = Commande.find_by_id(params[:id])
    if @commande.en_livraison?
      flash[:erreur] = 'Cette Commande est déjà en cours de livraison'
      redirect_to livreur_index_path
    else
      @commande.livreur_id = session[:livreur_id]
      @commande.save
      @commande.passer_etape_suivante
      redirect_to livreur_index_path
    end
  end

  def termine
    @commande = Commande.find_by_id(params[:id])
    @commande.passer_etape_suivante
    redirect_to livreur_index_path
  end

  def show
    @commande = Commande.find_by_id(params[:id])
  end

  private
  def commande_params
    params.require(:livreur).permit(:coordonnee, :nom, :prenom)
  end

  def set_livreur
    if session[:livreur_id].present?
      @compte_livreur = Livreur.find(session[:livreur_id])
    end
  end

end
