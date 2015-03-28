class CommandesController < ApplicationController

  def new
    @commande = Commande.new
    @ligne_commande = @commande.ligne_commandes.build
    redirect_to root_path
  end

  def create
    @commande = Commande.new(commande_params)
    @commande.ligne_commandes.each do |lc|
      lc.delete unless lc.valid?
    end
    @commande.save
    redirect_to commande_path(@commande.id)
  end

  def index
    @commandes = Commande.all
  end

  def show
    @commande = Commande.find_by_id(params[:id])
  end

  private
    def commande_params
      params.require(:commande).permit(:date,
        :heure,
        :statut,
        :numero_confirmation,
        :total,
        :restaurant_id,
        ligne_commandes_attributes:[:quantite, :plat_id])
    end
end


