class CommandesController < ApplicationController

  before_filter :authentification, except: [:index]

  def new
    @commande = Commande.new
    if session[:client_id].present?
      @compte_client = Client.find(session[:client_id])
    end
    @ligne_commande = @commande.ligne_commandes.build
    redirect_to root_path
  end

  def show
    if session[:client_id].present?
      @compte_client = Client.find(session[:client_id])
    end
    @commande = Commande.find(params[:id])
  end

  def edit
    if session[:client_id].present?
      @compte_client = Client.find(session[:client_id])
    end
    @commande = Commande.find(params[:id])
  end

  def passer_etape_suivante
    @commande = Commande.find_by_id(params[:id])
    @commande.passer_etape_suivante
    redirect_to restaurateur_preparer_commande_path
  end

  def create
    @commande = Commande.new(commande_params)
    if session[:client_id].present?
      @compte_client = Client.find(session[:client_id])
    end
    @commande.ligne_commandes.each do |lc|
      lc.delete unless lc.valid?
    end
      @commande.save
      @commande.a_preparer!
      #redirect_to commande_completer_commande_path(@commande.id)
      redirect_to commande_path(@commande.id)
  end

  def completer_commande
    if session[:client_id].present?
      @compte_client = Client.find(session[:client_id])
    end
    @commande = Commande.find(params[:id])
  end

  def index
    @commandes = Commande.all
    @addresses = @compte_client.all
  end

  def show
    @compte_client = Client.find_by_id(params[:id])
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
        :address_id,
        ligne_commandes_attributes:[:quantite, :plat_id])
    end
end


