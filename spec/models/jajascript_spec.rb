require 'spec_helper'

describe Jajascript do
  describe 'optimize' do
  	describe 'first case' do
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
  end
end
