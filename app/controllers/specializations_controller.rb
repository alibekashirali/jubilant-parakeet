class SpecializationsController < ApplicationController
  skip_authorization_check 
  
    def create
      current_user.specializations.create(category_id: params[:category_id])
      redirect_to :back
    end
   
    def destroy
      specialization = Specialization.find(params[:id])
      specialization.destroy
      redirect_to :back
    end
end
