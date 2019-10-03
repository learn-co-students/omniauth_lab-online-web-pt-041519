class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_or_create_by(uid: auth['uid']) do |user|
            user.name = auth['info']['name']
            user.email = auth['info']['email']
            user.image  =auth['infor']['image']
        end
        session[:user_id]=user.id
        redirect_to root_path
    end


    def destroy
      
    end
    private 
    
    def auth
        request.env['omniauth.auth']
    end

end
