require 'net/http'

class JajascriptController < ApplicationController
	
	JJS_URI = URI('http://quiet-depths-3065.herokuapp.com/jajascript/optimize')

	def optimize
		# p "optimize with -#{params}-"

		p params
		res = Net::HTTP.post_form(JJS_URI, params.except(:action, :controller))

		render :json =>	Jajascript.optimize(params.except(:controller, :action).first[0])
	end

end
