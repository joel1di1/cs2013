class JajascriptController < ApplicationController
	
	def optimize
		render :json => Jajascript.optimize(request.params)
	end

end
