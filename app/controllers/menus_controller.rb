class MenusController < RestaurateurController
  before_filter :authentification
  def new
   @restaurant = Restaurant.find(params[:restaurant_id])
   session[:restaurant_id] = params[:restaurant_id]
   @menu = @restaurant.menus.build
   @plat = @menu.plats.build
   @plat.description_plats.build
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
      flash[:notice] = "Le menu a été sauvegardé avec succès"
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
      flash[:notice] = "Menu créer avec succès"
      verifier_description
      redirect_to edit_menu_path(@menu.id)
    else
      render :action => 'new'
    end

	end

  private

    def menu_params
      params.require(:menu).permit( :nom, :restaurant_id,
                                  plats_attributes:[:id, description_plats_attributes:[:id,:nom,:description, :prix]])
    end

    def verifier_description
      faire_afficher_warning = false
      warning =["Vous n'avez pas mit de description pour le(s) plat(s) : "]
      @menu.plats.each do |plat|
        plat.description_plats.each do |desc_plat|
          next if desc_plat.description.present?
          warning << "#{desc_plat.nom}, "
          faire_afficher_warning = true
        end
      end
      flash[:warning] = warning.join[0...-2] if faire_afficher_warning
    end
end

