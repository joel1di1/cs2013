class QuestionController < ApplicationController


	def show
		if params[:q]
			UserMailer.new_question(params[:q]).deliver
			render :text => 'joel1di1@gmail.com'
		else
			render :text => 'Hello'	
		end
	end
end
