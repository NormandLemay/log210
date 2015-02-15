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
      super
      @restaurants = Restaurant.new(:nom=>params[:restaurants][:nom],:restaurateur_id=>params[:restaurants][:restaurateur_id])
      @restaurants.save
#    redirect_to admin_restaurant_path(:id=> @restaurant.id)
    end
  end


  index do
      selectable_column
      id_column
      column :nom
      column :restaurateur_id
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
    f.inputs "Restaurant" do
     f.input :nom
     f.input :restaurateur_id, :as => :select, :collection => Restaurateur.all.map{|res| [res.nom, res.id]}
    end
    f.actions
  end

end
