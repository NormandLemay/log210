class CommandesController < InheritedResources::Base

  def new
    @commande = Commande.new
    @ligne_commande = @commande.ligne_commandes.build
  end

  def create
    @commande = Commande.new(commande_params)
    @commande.ligne_commandes.each do |lc|
      unless lc.valid?
        lc.delete
      end
    end
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


