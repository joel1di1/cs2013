require 'spec_helper'

describe Jajascript do
  describe 'optimize' do
  	describe 'demo case' do
  		before :each do 
  			@data = "[
			    { \"VOL\": \"MONAD42\", \"DEPART\": 0, \"DUREE\": 5, \"PRIX\": 10 },
			    { \"VOL\": \"META18\", \"DEPART\": 3, \"DUREE\": 7, \"PRIX\": 14 },
			    { \"VOL\": \"LEGACY01\", \"DEPART\": 5, \"DUREE\": 9, \"PRIX\": 8 },
			    { \"VOL\": \"YAGNI17\", \"DEPART\": 5, \"DUREE\": 9, \"PRIX\": 7 }
			  ]".to_s
  		end

    	it { Jajascript.optimize(@data).should eq( {gain: 18, path: ["MONAD42", "LEGACY01"]} ) }
		end

		describe 'first test' do 
			before :each do 
				@data = "\n  {\"VOL\": \"AF514\", \"DEPART\":0, \"DUREE\":5, \"PRIX\": 10}\n"
			end
			it { Jajascript.optimize(@data).should eq( {gain: 10, path: ["AF514"]} ) }
		end
		describe 'first test 2' do 
			before :each do 
				@data = "\n  {\"VOL\": \"AF234\", \"DEPART\":0, \"DUREE\":5, \"PRIX\": 22}\n"
			end
			it { Jajascript.optimize(@data).should eq( {gain: 22, path: ["AF234"]} ) }
		end
  end
end
