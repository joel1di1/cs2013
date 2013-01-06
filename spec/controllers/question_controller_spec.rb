require 'spec_helper'

describe QuestionController do
	describe 'get question' do
		describe 'with query Quelle+est+ton+adresse+email' do
			it 'returns joel1di1' do
				get :show, :q => 'Quelle+est+ton+adresse+email'
				expect(response.code).to eq("200")
				expect(response.body).to eq('joel1di1@gmail.com')
			end
		end
	end
end
