require 'net/http'
require "base64"

class JajascriptController < ApplicationController
	
	JJS_URI = URI('http://ec2-54-242-230-71.compute-1.amazonaws.com:8080/jajascript/optimize')

	def optimize
		input = params.except(:action, :controller).first[0]
		res = Net::HTTP.post_form(JJS_URI, 'input' => input)
		render :text =>	res.body
	end

end
