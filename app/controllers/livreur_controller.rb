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
    @compte_livreur = @livreur
    @commandes = Commande.all
    @livreur.coordonnee = params[:coordonnee]
    @livreur.save
    @commandesPretes = @commandes.select {|commande| commande.status == 'prete'}


  @commandes.each do |commande|
    @commandesLivraison = @commandes.select {|commande| commande.status == 'en_livraison'}
  end
  @commandes.each do |commande|
    @mesCommandes = @commandesLivraison.select {|commande| commande.livreur_id == @compte_livreur.id}
  end

  @commandes.each do |commande|
    @commandesLivrer = @commandes.select {|commande| commande.status == 'livrer'}
  end
  @commandes.each do |commande|
    @mesCommandesCompletees = @commandesLivrer.select {|commande| commande.livreur_id == @compte_livreur.id}
  end



end



def accept
  if session[:livreur_id].present?
    @compte_livreur = Livreur.find(session[:livreur_id])
  end
  @commande = Commande.find_by_id(params[:id])
  @commande.passer_etape_suivante
  @commande.livreur_id = @compte_livreur.id
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



  end
  private
  def commande_params
    params.require(:livreur).permit(:coordonnee, :nom, :prenom)
  end

end