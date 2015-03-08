module AccueilHelper

  def displayMenuItems(restaurant)
    output = []
    restaurant.menus.each do |menu|
      output << "<h3 class=\"titremenu\">#{menu.nom}</h3>"
      menu.menu_items.each do |item|
        output<< "<br/><ul>"
        output << "<br/><li> Item: #{item.nom}</li>"
        output << "<br/><li> Description: #{item.description}   <input type=\"button\" name=\"boutonAjout\" value=\"Ajouter item a la commande\" ></li>"
        output << "<br/><li> Prix: #{item.prix} </li></ul>"
      end
    end
    output.join.html_safe
  end
end
