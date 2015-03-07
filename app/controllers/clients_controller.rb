class ClientsController < InheritedResources::Base

  def new
  	@client = Client.new
  	@client.build_compte
  	@client.address.build
  end


	def create
		super
	 # @client = Client.new(params[:client])
	 # if @client.save
	 #   flash[:notice] = "Successfully created client."
	 #   redirect_to clients_path
	 # else
	 #   render :action => 'new'
	 # end
	end

  private

    def client_params
      params.require(:client).permit(:nom, :prenom, :date_naissance, 
      	               compte_attributes:[:id, :courriel, :mot_de_passe],
      	               address_attributes: [:id, :rue, :no_civic, :pays, :province, :ville, :code_postal])
    end
end

