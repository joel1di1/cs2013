class JajascriptController < ApplicationController
	
	def optimize
		# p "optimize with -#{params}-"
		UserMailer.jajascript(params).deliver
		render :json =>	Jajascript.optimize(params.except(:controller, :action).first[0])
	end

end
