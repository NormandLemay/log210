ActiveAdmin.register Restaurateur do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :nom,:courriel, restaurants_attributes: [:id,:restaurateur_id]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  controller do

    def create
       @restaurateur = Restaurateur.new(:nom=>params[:restaurateur][:nom],:courriel=>params[:restaurateur][:courriel])
       @restaurateur.save
      if params[:restaurateur][:restaurants_attributes].present?
        params["restaurateur"]["restaurants_attributes"].values.each do |resto| 
          resto_id = resto.values_at("id")[0]
          puts resto_id
          restaurant = Restaurant.find(resto_id)
          restaurant.restaurateur_id = @restaurateur.id
          restaurant.save
        end
      else
        flash[:warning] = "Vous n'avez pas choisi de restaurant"
      end

       redirect_to admin_restaurateur_path(:id=> @restaurateur.id)
    end

    def update
      super
    end

    #def scoped_collection
    #  Restaurateur.inner_join(:restaurants)
    #end
  end

  index do
    selectable_column
    id_column
    column :nom
    column :courriel
    actions
  end

  filter :nom
  filter :courriel

  show do |restaurateur|
    attributes_table do
      row :nom
      row :courriel
      row "Restaurant(s)" do
        liste_resto = []
        restaurateur.restaurants.each do |resto|
          liste_resto << resto.nom
        end
        liste_resto.join('<br />').html_safe
      end

    end

  end


  form do |f|
    @restaurants = Restaurant.all
    f.inputs "Restaurateur" do
      f.input :nom
      f.input :courriel
      f.inputs do
        f.has_many :restaurants, sortable_start: 1 do |t|
          #t.input :nom
          #t.input :id, :as => :hidden
          t.input :id, :as => :select, :collection => Restaurant.all.map{|res| [res.nom, res.id]}
        end
      end
    end
    f.actions
  end
end
