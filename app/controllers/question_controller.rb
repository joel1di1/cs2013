require 'dentaku'
require 'net/http'

class QuestionController < ApplicationController

	CALC_URI = URI('http://web2.0calc.com/api/')

	def show
		question = params[:q]
		if question
			if m = request.query_string.match(/^q=([\.,\d\(\)\-+\/*]+)$/)
				render :text => calcul(m[1])
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

	def calcul exp
		exp = exp.gsub(',','.')
		res = calcul_on_0calc exp
		res.gsub('.',',')
	end

	def calcul_on_0calc exp
		res = Net::HTTP.post_form(CALC_URI, 'input' => exp)
		json = JSON.parse res.body
		json['results'].first['values'].second['string']
	end
end
