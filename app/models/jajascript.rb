class Jajascript

	def self.optimize data
		json = JSON.parse data
		{:gain=>json['PRIX'], :path=>[json['VOL']]}
	end

end
