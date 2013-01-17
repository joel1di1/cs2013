

class Node
	def initialize params
		@my_id = params[:id]
		@flights = []
	end

	def id
		@my_id
	end

	def flights
		@flights
	end

	def add_zero_flight_to node
		flight = Flight.new({"VOL" => "#{@my_id}-#{node.id}", "DEPART" => @my_id, "DUREE" => (node.id - @my_id), "PRIX" =>  0, "VIRTUAL" => true})
		flight.start_node = self
		flight.end_node = node
	end

	def to_s
		"<node(#{@my_id}) flights: #{@flights}"
	end
end