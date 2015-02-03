ActiveAdmin.register Restaurant do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :nom
    actions
  end


  show do |restaurant|
    attributes_table do
      row :nom
    end

  end


  form do |f|
    f.inputs "restaurant" do
      f.input :nom
    end
    f.actions
  end

end
