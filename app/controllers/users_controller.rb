class UsersController < ApplicationController
    skip_authorization_check
  
      def show
        @user = User.find(params[:id])
        @transports = @user.transports
      end
      
      def edit
        @transport = Transport.find(params[:id])
      end
      
  
      def destroy
          user = User.find(params[:id])
          user.destroy
          redirect_to :back
      end
  
end
