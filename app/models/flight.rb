class Flight < ActiveResource::Base
    self.site = "http://localhost:3001/"
	belongs_to :airplane

	def self.filterdate(from, to)
        a = Array.new
        if (from == "" ) or (to == "")
            a = Flight.all
        else
            from = from.to_date
            to = to.to_date
            for v in Flight.all
                condition = 0
                if (v.departure_date > from)
                    condition = condition + 1
                end

                if (v.arrival_date < to)
                    condition = condition + 1
                end

                if (condition == 2)
                    a.push(v)
                end
            end
            a
        end
  	end

  	def self.filterCompany(company_id)
          Flight.joins(airplane: :company).where(
          companies: {
            id: company_id
          }
       )
  	end

    def self.airplane_patent(registration)
        a = Array.new

        if registration == ""
            a = Flight.all
        else
            for i in Flight.all
                if i.airplane.registration == registration
                    a.push(i)
                end
            end
        end
        a
    end

    def self.airportU(airport)
        a = Array.new

        if airport == ""
            a = Flight.all
        else
            for i in Flight.all
                if i.flight.airport == airport
                    a.push(i)
                end
            end
        end
        a
    end

    def self.airportF(name)
        a = Array.new

        if name == ""
            a = Flight.all
        else
            for i in Flight.all
                if i.flight.name == name
                    a.push(i)
                end
            end
        end
        a
  end

end
