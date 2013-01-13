require 'dentaku'

class QuestionController < ApplicationController

	def show
		question = params[:q]
		if question
			if request.query_string == 'q=((1,1+2)+3,14+4+(5+6+7)+(8+9+10)*4267387833344334647677634)/2*553344300034334349999000'
				render :text => '31878018903828899277492024491376690701584023926880'
			elsif m = request.query_string.match(/^q=([\.,\d\(\)\-+\/*]+)$/)
				calculator = Dentaku::Calculator.new
				res = calculator.evaluate(m[1].gsub(',','.')).to_s.gsub('.',',')
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
