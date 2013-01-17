class Flight
	def initialize params
		@vol = params['VOL']
		@depart = params['DEPART']
		@duree = params['DUREE']
		@prix = params['PRIX']
		@virtual = !!params['VIRTUAL']
		@start_node = nil
		@end_node	 = nil
	end

	def vol
		@vol
	end

	def depart
		@depart
	end

	def duree
		@duree
	end

	def prix
		@prix
	end

	def virtual
		@virtual
	end

	def start_node= start_node
		@start_node = start_node
		start_node.flights << self
	end

	def end_node= end_node
		@end_node = end_node
	end

	def start_node
		@start_node
	end

	def end_node
		@end_node
	end

	def to_s
		"Flight #{@vol} [depart:#{@depart}, duree: #{@duree}, prix: #{@prix}, start_node: #{start_node.id}, end_node: #{end_node.id}]"
	end

end