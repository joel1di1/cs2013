require 'dentaku'

class QuestionController < ApplicationController

	def show
		question = params[:q]
		if question
			p request.query_string
			if m = request.query_string.match(/^q=([\.,\d\(\)\-+\/*]+)$/)
				calculator = Dentaku::Calculator.new
				res = calculator.evaluate(m[1].sub(',','.')).to_s.sub('.',',')
				m = res.match /^(\-?\d+),0+$/
				res = m[1] if m
				render :text => res
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
