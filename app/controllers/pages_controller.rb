class PagesController < ApplicationController
    skip_authorization_check 
    
    def home
        if user_signed_in?
        @orders = current_user.relevant_orders
        else
        end
    end
  
    def about
    end
  
    def help
    end
    
end
