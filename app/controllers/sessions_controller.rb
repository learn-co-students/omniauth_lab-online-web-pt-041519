class SessionsController < ApplicationController

    
    def create

        #@user = User.find_or_create_by(uid: auth['uid'])

        # if @user
        #     @user.name = auth['info']['name']
        #     @user.email = auth['info']['email']
        #     # @user.image = auth['info']['image']
        #     @user.save
        # elsif !@user

        # end


        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end
        @user.save
        binding.pry

    
        session[:user_id] = @user.id
        
        render 'welcome/home'
    
    end

    private

    def auth
        request.env['omniauth.auth']
    end

    # def user_params
    # end

end
