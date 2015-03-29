module CommandesHelper

  def getAddressForm()
    output = []
    output << '<div id="div_address_id">'
    output << 'Numéro civique:  <input type="text" name="no_civic" id="no_civic"><br/>'
    output << 'Rue: <input type="text" name="rue" id="rue"><br/>'
    output << 'Code Postal: <input type="text" name="code_postal" id="code_postal"><br/>'
    output << 'Ville: <input type="text" name="ville" id="ville"><br/>'
    output << 'Province: <input type="text" name="province" id="province"><br/>'
    output << 'Pays: <input type="text" name="pays" id="pays"><br/>'
    output << '<input id="bouton_confirmation_id" type="submit" value="Confirmation">'
    output << '</div>'
    output.join.html_safe
  end
end
