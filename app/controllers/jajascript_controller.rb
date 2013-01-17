class JajascriptController < ApplicationController
	
	def optimize

		p "Jajascript - #{params}"

		res = Rails.cache.fetch params do
			Jajascript.optimize(params.except(:controller, :action).first[0])
		end
		render :json => res
	end

end
