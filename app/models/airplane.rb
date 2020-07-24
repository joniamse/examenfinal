class Airplane < ActiveResource::Base
    self.site = "http://localhost:3001/"
	has_many :flights
	belongs_to :company

	def flights_count(airplane)
        count = 0
        for i in Flight.all
            if i.airplane == airplane
                count = count + 1
            end
        end
        count
    end

    def self.company_name(name)
        a = Array.new

        if name == ""
            a = Airplane.all
        else
            for i in Airplane.all
                if i.company.name == name
                    a.push(i)
                end
            end
        end
        a
    end

    def self.airplaneU(registration)
        a = Array.new

        if registration == ""
            a = Airplane.all
        else
            for i in Airplane.all
                if i.airplane.registration == registration
                    a.push(i)
                end
            end
        end
        a
    end
end
