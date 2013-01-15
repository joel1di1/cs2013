class JajascriptController < ApplicationController
	
	def optimize
		render :json => Jajascript.optimize(params.except(:controller, :action).first[0])
	end

end
