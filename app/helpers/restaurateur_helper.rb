module RestaurateurHelper

  # ce script provient de railscast video 196
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', class: 'add_fields', data: {id: id, fields: fields.gsub('\n', '')})
  end

  #Ce script est pour trier les commandes d'un restaurateur
  def sortable_heading( label, field, make_link )
    up_params = { :order => field, :direction => 'asc' }
    down_params = { :order => field, :direction => 'desc' }
    link_to( '^', make_link.call( up_params ) ) + label + link_to( 'v', make_link.call( down_params ) )
  end

  def formater_adresse(adresse)
    if adresse
      "#{adresse.no_civic} #{adresse.rue},#{adresse.ville},#{adresse.province} ,#{adresse.pays}"
    else
      ""
    end
  end
end
