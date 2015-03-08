module AccueilHelper

  def displayMenuItems(restaurant)
    output = []
    restaurant.menus.each do |menu|
      output << "<h3 class=\"titremenu\">nom du menu#{menu.nom}</h3>"
      menu.menu_items.each do |item|
        output<< "<br/><ul>"
        output << "<br/><li> nom de l'item: #{item.nom}</li>"
        output << "<br/><li> description de l'item: #{item.description}</li>"
        output << "<br/><li> prix de l'item: #{item.prix} </li></ul>"
      end
    end
    output.join.html_safe
  end
end
