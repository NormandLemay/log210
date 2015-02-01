ActiveAdmin.register Restaurateur do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :nom,:courriel
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
     column :courriel
     actions
   end

   filter :nom
   filter :courriel

   show do |restaurateur|
     attributes_table do
       row :nom
       row :courriel
     end

   end

   form do |f|
     f.inputs "Restaurateur" do
       f.input :nom
       f.input :courriel
     end
     f.actions
   end
end
