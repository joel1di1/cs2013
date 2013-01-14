class JajascriptController < ApplicationController
	
	def optimize
		render :json => {gain: 10, path: "AF514"}
	end

end
