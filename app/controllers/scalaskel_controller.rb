class ScalaskelController < ApplicationController
	
	def change
		res = Rails.cache.fetch params[:amount] do
			Scalaskel.change(params[:amount].to_i)
		end
		render :json => res
	end

end
