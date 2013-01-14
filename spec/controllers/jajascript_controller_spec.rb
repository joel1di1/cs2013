require 'spec_helper'

describe JajascriptController do
	describe 'optimize' do
		before :each do
			Jajascript.stub(:optimize).and_return('return_value')
	    post :optimize, :payload => 'test'
		end
		it 'delegates to Jajascript' do
		 response.body.should eq('return_value') 
		end
	end
end