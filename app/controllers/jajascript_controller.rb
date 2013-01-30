class JajascriptController < ApplicationController
	
	def optimize
		# p "optimize with -#{params}-"
		UserMailer.new_question(params).deliver
		render :json =>	Jajascript.optimize(params.except(:controller, :action).first[0])
	end

end
