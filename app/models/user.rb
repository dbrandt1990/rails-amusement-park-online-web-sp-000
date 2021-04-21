class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood 
        if nausea > happiness
            "sad"
        else
            "happy"
        end
    end

    def admin? 
        if admin
            "ADMIN"
        end
    end

    def mood?
        if nausea.nil? || happiness.nil?
            "N/A"
        else
            mood
        end
    end
end
