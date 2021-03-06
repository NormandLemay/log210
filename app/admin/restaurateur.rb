ActiveAdmin.register Restaurateur do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :nom, compte_attributes:[:id, :courriel, :mot_de_passe], restaurants_attributes: [:id,:restaurateur_id]
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
       @restaurateur = Restaurateur.new(restaurateur_params)
       @restaurateur.save
      if params[:restaurateur][:restaurants_attributes].present?
        params['restaurateur']['restaurants_attributes'].values.each do |resto|
          resto_id = resto.values_at('id')[0]
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
      @restaurateur = Restaurateur.find(params[:id])
      @restaurateur.update_attributes(restaurateur_params)
        params['restaurateur']['restaurants_attributes'].values.each do |resto|
          resto_id = resto.values_at('id')[0]
          restaurant = Restaurant.find(resto_id)
          restaurant.update_attribute(:restaurateur_id,@restaurateur.id)
        end
      redirect_to admin_restaurateur_path(@restaurateur.id)
    end

  private

    def restaurateur_params
      params.require(:restaurateur).permit(:nom,
                     compte_attributes:[:id, :courriel, :mot_de_passe])
    end

  end

  index do
    selectable_column
    id_column
    column :nom
    actions
  end

  filter :nom

  show do |restaurateur|
    attributes_table do
      row :nom
      row 'Courriel' do
        restaurateur.compte.courriel
      end
      row 'Restaurant(s)' do
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
    compte = restaurateur.compte.presence || restaurateur.build_compte
    f.inputs 'Restaurateur' do
      f.input :nom
      f.inputs 'compte' do
        f.semantic_fields_for :compte do |t|
          t.input :courriel
          t.input :mot_de_passe, :as => :password if compte.mot_de_passe.blank?
        end
      end
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
