module ApplicationHelper
    def auth_token
        return '<input type= "hidden" name = "authenticility_token" value ="<%= form_authenticity_token %>"/>'.html_safe
    end
end
