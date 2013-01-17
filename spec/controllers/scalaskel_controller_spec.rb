require 'spec_helper'

describe ScalaskelController do
	before :each do
		Rails.cache.clear
	end
	describe 'change' do
		it 'should return Scalaskel change' do
			response = {}
			Scalaskel.should_receive(:change).once.with(34).and_return(response)
			get :change, :amount => 34
		end
	end
end
