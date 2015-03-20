ActiveAdmin.register Restaurant do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :nom, :restaurateur_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  #
  controller do
    def create
      @restaurant = Restaurant.new(:nom=>params[:restaurant][:nom],:restaurateur_id=>params[:restaurant][:restaurateur_id])
      @restaurant.save
      flash[:warning] = 'Aucun restaurateur sélectionné' unless @restaurant.restaurateur_id.present?
      redirect_to admin_restaurant_path(:id=> @restaurant.id)
    end
  end

  action_item(:only => :show) do
    link_to 'Créer un menu', create_menu_admin_restaurant_path
  end

 # @params :restaurant_id
  member_action :create_menu, :title => 'Créer un menu', :method => [:get, :post] do
    @restaurant = Restaurant.find(params[:id])
  end

  index do
    selectable_column
    id_column
    column :nom

    column :restaurateur_id do |restaurant|
      if restaurant.restaurateur_id.present?
        restaurant.restaurateur.nom
      else
        'Aucun restaurateur sélectionné'
      end
    end
    actions
  end

  show do |restaurant|
    attributes_table do
      row :nom
      row :restaurateur_id
    end
  end
  filter :nom
  filter :restaurateur_id

  form do |f|
    f.inputs 'Restaurant' do
     f.input :nom
     f.input :restaurateur_id, :as => :select, :collection => Restaurateur.all.map{|res| [res.nom, res.id]}
    end
    f.actions
  end


end
