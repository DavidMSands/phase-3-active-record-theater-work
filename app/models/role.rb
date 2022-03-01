class Role < ActiveRecord::Base
    has_many :auditions 

    def actors 
        self.auditions.all.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.all.map do |audition|
            audition.location
        end
    end

    def lead 
        lead = Audition.where("role_id = #{self.id} and hired = 't'").first
        if lead == nil 
            "no actor has been hired for this role"
        else
            lead
        end
    end

    def understudy 
        lead = Audition.where("role_id = #{self.id} and hired = 't'").second

        if lead == nil 
            "no actor has been hired for understudy for this role"
        else
            lead
        end
    end
end