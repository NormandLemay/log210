class CommandesController < InheritedResources::Base

  def new
    @commande = Commande.new
  end

  def getMenuRestaurant()
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:id])
  end
  private
    def commande_params
      params.require(:commande).permit( :date, :heure, :statut, :numero_confirmation, :total ,  ligne_commande:[:quantite])
    end
end