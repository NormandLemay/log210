class CommandesController < ApplicationController

  before_filter :authentification, except: [:index]

  def new
    @commande = Commande.new
    @ligne_commande = @commande.ligne_commandes.build
    redirect_to root_path
  end

  def edit
    @commande = Commande.find(params[:id])
  end

  def passer_etape_suivante
    @commande = Commande.find_by_id(params[:id])
    @commande.passer_etape_suivante
    redirect_to restaurateur_preparer_commande_path
  end

  def create
    @commande = Commande.new(commande_params)
    @commande.ligne_commandes.each do |lc|
      lc.delete unless lc.valid?
    end
    @commande.save
    @commande.a_preparer!
    redirect_to commande_afficher_sommaire_path(:id=> @commande.id)
  end

  def afficher_sommaire
    @commande = Commande.find_by_id(params[:id])
    @addresses = @compte_client.address
    @adresse_nouvelle = Address.new
  end

  def completer_commande
    @commande = Commande.find_by_id(params[:id])

    if(params[:rue].nil?)
      @commande.address_id = params[:id_add]
      render action: 'show', id: @commande.id
      @compte_client.save
      @commande.save
   else
    adresse = Address.new(no_civic: params[:no_civic],
                          rue: params[:rue],
                          code_postal: params[:code_postal],
                          ville: params[:ville],
                          province: params[:province],
                          pays: params[:pays])
    adresse.save

    @compte_client.address << adresse
    @commande.address_id = adresse.id
    @compte_client.save
    @commande.save
    render action: 'show', id: @commande.id
      end

  end

  def index
    @commandes = Commande.all
    @addresses = @compte_client.all
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
        address_attributes:[:no_civic, :rue, :code_postal, :ville, :province, :pays, :id],
        ligne_commandes_attributes:[:quantite, :plat_id])
    end
end