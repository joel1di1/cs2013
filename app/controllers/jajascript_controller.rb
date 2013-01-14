class JajascriptController < ApplicationController
	
	def optimize
		render :json => Jajascript.optimize(params.except(:controller, :action))
	end

end
