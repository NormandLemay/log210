module AccueilHelper

  def displayMenuItems(nomRestaurant)
    output = []
      @restaurant.each do |restaurant|
      if (restaurant.nom == nomRestaurant)
          restaurant.menus.each do |menu|
          output << "<h3 class=\'titremenu\'>#{menu.nom}</h3>"
          menu.menu_items.each do |item|
             output<< '<br /><ul>'
             output << '<br /><li> Item: #{item.nom}</li>'
             output << '<br /><li> Description: #{item.description} <input type=\'button\' name=\'boutonAjout\' value=\'Ajouter item a la commande\' ></li>'
             output << '<br /><li> Prix: #{item.prix} </li></ul>'
           end
        end
        output.join.html_safe
      end
    end
  end


  def addHeader()
    output = []
    output << '<div class = header>Liste des restaurants participants: <select id=\'restaurant_id\' onChange=\'restaurantChoisi()\'>'
    output << '<option selected disabled hidden value=\'\'>Sélectionner un restaurant</option>'
     @restaurants.each do |r|
       output <<    '<option>'
       output <<      r.nom
       output <<    '</option>'
     end
    output << '</select></div>'
    output.join.html_safe
  end

 def ajoutDropDown()
    output = []
    output << '<select id=\'qte<%=plat.id%>\'>'
    output << '<option selected disabled hidden value=\'\'>Quantité</option>'
    output <<    '<option>1</option>'
    output <<    '<option>2</option>'
    output <<    '<option>3</option>'
    output <<    '<option>4</option>'
    output <<    '<option>5</option>'
    output << '</select>'
    output.join.html_safe
  end

end
