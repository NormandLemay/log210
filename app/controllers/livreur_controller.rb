class LivreurController < ApplicationController

def index
  if session[:livreur_id].present?
    @compte_livreur = Livreur.find(session[:livreur_id])
  end
end

end