class Path

	def initialize path=nil, flight=nil
		@flights = []
		@flights.concat(path.fligths) if path
		@flights << flight if flight
		@gain = 0
		@gain += path.gain if path
		@gain += flight.prix if flight
	end

	def gain
		@gain
	end

	def fligths
		@flights
	end

	def to_json
		real_flights = @flights.select{|flight| !flight.virtual}
		{gain: @gain, path: real_flights.map(&:vol)}
	end

end
