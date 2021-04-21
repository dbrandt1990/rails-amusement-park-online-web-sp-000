class RidesController < ApplicationController
     
    def ride
        @attraction = Attraction.find(session[:current_attraction_id])

        height = current_user.height - @attraction.min_height
        tickets = current_user.tickets - @attraction.tickets
        nausea = current_user.nausea + @attraction.nausea_rating
        happiness = current_user.happiness + @attraction.happiness_rating
                    
        if height < 0 && tickets < 0

            redirect_to "/users/#{current_user.id}", alert: "You are not tall enough to ride the #{@attraction.name}. You do not have enough tickets to ride the #{@attraction.name}."
            
        elsif height < 0

            redirect_to "/users/#{current_user.id}", alert: "You are not tall enough to ride the #{@attraction.name}."

        elsif tickets < 0 

            redirect_to "/users/#{current_user.id}", alert: "You do not have enough tickets to ride the #{@attraction.name}."
        else
            
        @attraction.users << current_user

        current_user.update(tickets: tickets, nausea: nausea, happiness: happiness)
            
        redirect_to "/users/#{current_user.id}", alert: "Thanks for riding the #{@attraction.name}!"
        end
    end
end
