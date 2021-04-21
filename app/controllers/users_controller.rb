class UsersController < ApplicationController
    def homepage
        render 'users/homepage'
    end
    
    def new
        @user = User.new()
        render '/users/new'
    end

    def create
        @user = User.create(user_params)
        
        if @user.nil?
            redirect_to '/users/new'
        else
            session[:user_id] = @user.id
            redirect_to "/users/#{@user.id}" 
        end
    end

    def show
        @user =  User.find_by(id: session[:user_id])
        if  @user
            render "/users/show"
        else
            redirect_to '/'
        end
    end

    private 

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end