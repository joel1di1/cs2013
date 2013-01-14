class Jajascript

	def self.optimize data
		json = JSON.parse data
		res = {:gain=>json['PRIX'], :path=>[json['VOL']]}
		p res
		res
	end

end
