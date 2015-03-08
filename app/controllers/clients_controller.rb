class ClientsController < InheritedResources::Base

  def new
  	@client = Client.new
  	@client.build_compte
  	@client.address.build
  end

  def update
	  @client = Client.find(params[:id])
	  @client.update_attributes(client_params)
	  if @client.save
	    flash[:notice] = "Compte client créer avec succès"
	    session[:client_id] = @client.id
	    redirect_to root_path
	  else
	    render :action => 'new'
	  end
  end


	def create
	 #super
	  @client = Client.new(client_params)
	  if @client.save
	    flash[:notice] = "Compte client créer avec succès"
	    session[:client_id] = @client.id
	    redirect_to root_path
	  else
	    render :action => 'new'
	  end
	end

  private

    def client_params
      params.require(:client).permit(:nom, :prenom, :date_naissance, :telephone, 
      	               compte_attributes:[:courriel, :mot_de_passe],
      	               address_attributes: [:rue, :no_civic, :pays, :province, :ville, :code_postal])
    end
end
