require 'dentaku'

class QuestionController < ApplicationController

	def show
		question = params[:q]
		if question
			p request.query_string
			if m = request.query_string.match(/^q=([\.\d\(\)\-+\/*]+)$/)
				calculator = Dentaku::Calculator.new
				render :text => calculator.evaluate(m[1].sub(',','.')).to_s.sub('.',',')
			else
				answer = Answer.find_by_question question
				if answer.nil?
					UserMailer.new_question(question).deliver
					answer = Answer.create(:question => question, :answer_string => "je ne sais pas")
				end
				render :text => answer.answer_string
			end
		else
			render :text => 'Hello'	
		end
	end
end
