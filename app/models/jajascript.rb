class Jajascript

	def self.optimize data
		p 'data'
		p data
		{:gain=>data['PRIX'], :path=>[data['VOL']]}
	end

end
