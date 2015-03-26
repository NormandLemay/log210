class CommandesController < InheritedResources::Base

  def new
    @commande = Commande.new
    @ligne_commande = @commande.ligne_commandes.build
  end

  private
    def commande_params
      params.require(:commande).permit( :date, :heure, :statut, :numero_confirmation, :total ,  ligne_commande:[:quantite])
    end
end