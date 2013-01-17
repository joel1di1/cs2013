class ScalaskelController < ApplicationController
	
	def change

		p "Scalaskel - #{params}"

		res = Rails.cache.fetch params[:amount] do
			Scalaskel.change(params[:amount].to_i)
		end
		render :json => res
	end

end
