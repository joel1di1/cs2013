class Jajascript

	def self.optimize data

		return {gain: 0, path: []} if data.blank?

		flights = JSON.parse data rescue JSON::ParserError
		flights ||= JSON.parse('['+data+']') 

		flights = [flights] if flights.kind_of? Hash

		nodes = process_flights flights
		find_best_plan nodes
	end

	def self.find_best_plan nodes

		nodes.each do |node|
			node.flights_to.each do |flight|
				new_path = Path.new(flight.start_node.best_path, flight)
				if node.best_path.gain < new_path.gain
					node.best_path = new_path
				end
			end
		end

		nodes.last.best_path.to_json
	end

	def self.compute_price plan
		plan.map(&:prix).inject(0, &:+)
	end

	def self.process_flights flights
		nodes = []
		nodes[0] = Node.new :id => 0
		flights.map{|flight| process_flight nodes, flight}
		nodes
	end

	def self.process_flight nodes, flight
		nodes = ensure_nodes_contains(nodes, flight["DEPART"]+flight["DUREE"])
		nodes = add_flight_to_nodes nodes, flight
		nodes
	end

	def self.add_flight_to_nodes nodes, flight_params
		flight = Flight.new flight_params
		flight.start_node = nodes[flight.depart]
	  flight.end_node   = nodes[flight.depart + flight.duree] 
	  nodes
	end

	def self.ensure_nodes_contains nodes, max_node_id
		while nodes.size < max_node_id + 1
			node = Node.new :id => nodes.size
			nodes.last.add_zero_flight_to node
			nodes << node
		end
		nodes
	end
end


