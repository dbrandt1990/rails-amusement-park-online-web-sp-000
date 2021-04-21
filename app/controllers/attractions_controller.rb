class AttractionsController < ApplicationController

    def index
       @attractions = Attraction.all
    end 

    def show
        @attraction = Attraction.find(params[:id])
        session[:current_attraction_id] = @attraction.id
    end

    def new
        render '/attractions/new'
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to "/attractions/#{@attraction.id}"
    end

    def edit
         @attraction = Attraction.find(params[:id])  
         render "/attractions/edit"
    end

    def update
        attraction = Attraction.find(params[:id])
        attraction.update(attraction_params)
        redirect_to "/attractions/#{attraction.id}"
    end

    private 

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
    end
end