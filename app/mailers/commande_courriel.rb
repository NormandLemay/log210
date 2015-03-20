class CommandeCourriel < ActionMailer::Base

  default from: 'lem.norm@gmail.com'

  def confirmation_commande(compte)
    @compte = compte
    mail(to: @compte.email, subject: 'Sample Email').deliver!
  end

end
