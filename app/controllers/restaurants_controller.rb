class MenusController < ApplicationController
  before_filter :authentification
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @commandes = @restaurant.commandes.build
    @ligne_commandes = @commandes.ligne_commandes.build
  end

  def edit
    @menu = Menu.find(params[:id])
    @restaurant = @menu.restaurant
    @plat = @menu.plats.build
    @plat.description_plats.build
    session[:restaurant_id] = @menu.restaurant_id
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update_attributes(menu_params)
    if @menu.save
      flash[:notice] = 'Le menu a été sauvegardé avec succès'
      verifier_description
      redirect_to edit_menu_path(@menu.id)
    else
      render :edit
    end
  end

  def create
    @menu = Menu.new(menu_params)
    @restaurant = Restaurant.find(session[:restaurant_id])
    if @menu.save
      flash[:notice] = 'Menu créer avec succès'
      verifier_description
      redirect_to edit_menu_path(@menu.id)
    else
      render action: 'new'
    end
  end

private

  def menu_params
    params.require(:menu).permit(:nom, :restaurant_id,
                                 plats_attributes: [:id,
                                                   description_plats_attributes: [:id,
                                                                                  :nom,
                                                                                  :description,
                                                                                  :prix]])
  end

end