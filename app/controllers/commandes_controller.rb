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
    #ici si tu fait afficher les params avec debugger
   #tu pourras plus facilement faire ton create
   #adresse = Address.create!(params)
     #ensuite tu fais @commande.address_id = adresse.id
    puts "TEST PARAM AVANT DELETE ",params
    #params.delete :action
    #params.delete :controller
   # puts "TEST PARAM APRÈS DELETE ",params
    @adresse = Address.create!(params)
    @compte_client.address.create(params)
    @commande.address_id = @adresse.id
    render action: 'show', id: @commande.id
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