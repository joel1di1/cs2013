class Jajascript

	def self.optimize data
		json = JSON.parse data
		p json
		res = {:gain=>json['PRIX'], :path=>[json['VOL']]}
		p res
		res
	end

end
