class Jajascript

	def self.optimize data
		flights = JSON.parse data
		flights = [flights] if flights.kind_of? Hash

		nodes = process_flights flights
		find_best_plan nodes
	end

	def self.find_best_plan nodes
		flight_plans = find_all_plans nodes
		best_plan = flight_plans.pop
		best_plan_price = compute_price best_plan
		while plan = flight_plans.pop
			plan_price = compute_price plan
			if plan_price > best_plan_price
				best_plan_price = plan_price
				best_plan = plan
			end
		end
		best_plan = best_plan.select{|flight| !flight.virtual}
		{:gain => best_plan_price, :path => best_plan.map(&:vol)}
	end

	def self.compute_price plan
		plan.map(&:prix).inject(0, &:+)
	end

	def self.find_all_plans nodes
		plans_to_proceed = nodes[0].flights.map{|flight| [flight]}

		all_plans = []
		while plan = plans_to_proceed.pop
			end_node = plan.last.end_node
			if !end_node.flights.empty?
				end_node.flights.each do |flight|
					new_plan = Array.new(plan)
					new_plan << flight
					plans_to_proceed << new_plan
				end
			else
				all_plans << plan
			end
		end
		all_plans
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


