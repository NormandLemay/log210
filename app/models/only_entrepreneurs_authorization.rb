class OnlyEntrepreneursAuthorization < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    case subject
      when ActiveAdmin::Page
        action == :read && subject.name == 'Dashboard' && subject.namespace.name == :admin

      else
        if( defined? subject.name )
          ['Dashboard', 'Entrepreneur', 'Restaurant', 'Menu', 'Restaurateur'].include?(subject.name)
        else
          true
        end
    end
  end
end