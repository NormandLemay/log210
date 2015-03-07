ActiveAdmin.register Menu do

  permit_params :nom, :restaurant_id,  menu_items_attributes: [:id, :nom, :description, :prix, :restaurant_id, :_destroy]

  controller do

    def create
     # flash[:notice] = Benchmark.bm(7) do |x|
     #   x.report("create menu") do
          i = 0
          warning =["Vous n'avez pas mit de description pour le(s) plat(s) : "]
          if params[:menu][:menu_items_attributes].present?
          params[:menu][:menu_items_attributes].each do #TODO a revoir
            nom = params[:menu][:menu_items_attributes]["#{i}"]["nom"]
            next if nom.blank?
            description = params[:menu][:menu_items_attributes]["#{i}"]["description"]
            warning << "#{nom}, " if description.blank?
            i+=1
          end

          puts warning
          flash[:warning] = warning.join[0...-2] if warning.present?
        end
          super
    #    end
    #  end
    end

    def update
      super
    end
  end

  index do
    selectable_column
    id_column
    column :nom
    column "nombre d'items" do |m|
      m.menu_items.count
    end
    actions
  end

  filter :nom

  show do |menu|
    attributes_table do
      row :nom
      row "item(s)" do
        liste_item = []
        menu.menu_items.each do |item|
          liste_item << "#{item.nom}, #{item.description}, #{item.prix}"
        end
        liste_item.join('<br />').html_safe
      end
    end
  end

  form do |f|
    restaurateur = Restaurateur.first
    f.inputs "Menu" do
      f.input :nom
      f.input :restaurant_id, :as => :select, :collection => restaurateur.restaurants.map{|res| [res.nom, res.id]}
      f.inputs do
        f.has_many :menu_items, allow_destroy: true do |t|
          t.input :nom
          t.input :description
          t.input :prix
        end
      end
    end
    f.actions
  end
end
