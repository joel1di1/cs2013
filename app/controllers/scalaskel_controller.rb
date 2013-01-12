class ScalaskelController < ApplicationController
	
	def change
		render :json => Scalaskel.change(params[:amount].to_i)
	end

end
