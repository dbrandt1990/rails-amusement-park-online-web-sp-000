class SessionsController < ApplicationController
    def new
        @user_names = User.all
        render '/sessions/signin'
    end

    def create
        @user = User.find_by(id: params[:user][:name])#using 'name'on form for Capybara, but returning :id to avoid duplicate login attempts
       
        if @user.nil?
          redirect_to "/users/new", alert: 'No user found, please sign up'
        else
          return head(:forbidden) unless @user.authenticate(params[:password])

          session[:user_id] = @user.id
          redirect_to "/users/#{@user.id}"
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end
    
end