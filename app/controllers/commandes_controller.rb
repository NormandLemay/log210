class CommandesController < InheritedResources::Base

  def new
    @commande = Commande.new
    @ligne_commande = @commande.ligne_commandes.build
  end

  def create
    debugger
    @commande = Commande.new(commande_params)
    @commande.save
    redirect_to root_path
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


