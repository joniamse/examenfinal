class Company < ActiveResource::Base
	self.site = "http://localhost:3001/"
	has_many :airplanes
end
