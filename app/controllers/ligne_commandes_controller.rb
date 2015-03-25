class LigneCommandesController < InheritedResources::Base

  private

    def ligne_commande_params
      params.require(:ligne_commande).permit(:quantite)
    end



end

