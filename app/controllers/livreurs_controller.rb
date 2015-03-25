class LivreursController < InheritedResources::Base

  layout 'restaurateur'

  def new
    @livreur = Livreur.new
    @livreur.build_compte
  end

  def create
    #super
    @livreur = Livreur.new(livreur_params)
    if @livreur.save
      flash[:notice] = 'Compte livreur créer avec succès'
      #session[:livreur_id] = @livreur.id
      redirect_to livreurs_path
    else
      render :action => 'new'
    end
  end

  private

    def livreur_params
      params.require(:livreur).permit(:nom, :prenom,
                                      compte_attributes:[:id, :courriel, :mot_de_passe])

    end
end

