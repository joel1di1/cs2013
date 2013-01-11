class QuestionController < ApplicationController

	def show
		question = params[:q]
		if question
			answer = Answer.find_by_question question
			if answer.nil?
				UserMailer.new_question(question).deliver
				answer = Answer.create(:question => question, :answer_string => "je ne sais pas")
			end
			render :text => answer.answer_string
		else
			render :text => 'Hello'	
		end
	end
end
