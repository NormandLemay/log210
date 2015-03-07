class OnlyEntrepreneursAuthorization < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    case subject
      when ActiveAdmin::Page
        action == :read && subject.name == "Dashboard" && subject.namespace.name == :admin

      else
        if( defined? subject.name )
          subject.name == "Dashboard" || subject.name == "Entrepreneur" || subject.name == "Restaurant" || subject.name == "Menu" || subject.name == "Restaurateur"
        else
          true
        end
    end
  end
end