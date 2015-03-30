Rails.application.routes.draw do

  resources :ligne_commandes
  resources :commandes

  post 'commande/completer_commande' => 'commandes#completer_commande'
  get 'commande/afficher_sommaire' => 'commandes#afficher_sommaire'

  resources :livreurs
  get 'livreur/index'
  get 'restaurateur/index'
  get 'livreur/accept'
  get 'restaurateur/preparer_commande'
  get 'livreur/show'
  put 'restaurateur/passer_etape_suivante'
  get 'livreur/termine'
  post 'livreur/liste_commandes' => 'livreur#liste_commandes'
  get 'livreur/index' => 'livreur#index'


  get 'livreur/position'
  get 'restaurateur/gerer_livreur'
  post '/restaurateur/deconnexion' => 'restaurateur#deconnexion'


  resources :accueil

  post '/accueil/deconnexion' => 'accueil#deconnexion'
  post '/accueil/connexion' => 'accueil#connexion'
  post '/accueil/connexion' => 'accueil#connexion'

  resources :clients

  resources :menus

  devise_for :entrepreneurs, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation:
  #  first created -> highest priority.
  # See how all your routes lay out with 'rake routes'.

  # You can have the root of your site routed with 'root'
  root 'accueil#index'
end
