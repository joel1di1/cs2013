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

		describe 'test with strange array' do
			before :each do 
				@data = "\n  {\"VOL\": \"AF1\", \"DEPART\":0, \"DUREE\":1, \"PRIX\": 10},\n  {\"VOL\": \"AF2\", \"DEPART\":1, \"DUREE\":1, \"PRIX\": 10}\n"
			end
			it { Jajascript.optimize(@data).should eq( {gain: 20, path: ["AF1", "AF2"]} ) }
		end

		# describe 'test with lots of data' do
		# 	before :each do 
		# 		@data = " { \"VOL\": \"impossible-timer-57\", \"DEPART\": 0, \"DUREE\": 4, \"PRIX\": 7 }, { \"VOL\": \"relieved-housewife-92\", \"DEPART\": 1, \"DUREE\": 2, \"PRIX\": 3 }, { \"VOL\": \"plain-chrome-33\", \"DEPART\": 2, \"DUREE\": 6, \"PRIX\": 5 }, { \"VOL\": \"successful-cooking-16\", \"DEPART\": 4, \"DUREE\": 5, \"PRIX\": 21 }, { \"VOL\": \"colorful-shoeshine-68\", \"DEPART\": 5, \"DUREE\": 2, \"PRIX\": 1 }, { \"VOL\": \"thundering-fawn-73\", \"DEPART\": 5, \"DUREE\": 4, \"PRIX\": 15 }, { \"VOL\": \"pleasant-snowmobile-77\", \"DEPART\": 6, \"DUREE\": 2, \"PRIX\": 9 }, { \"VOL\": \"wicked-magnum-3\", \"DEPART\": 7, \"DUREE\": 6, \"PRIX\": 3 }, { \"VOL\": \"odd-scraper-76\", \"DEPART\": 9, \"DUREE\": 5, \"PRIX\": 19 }, { \"VOL\": \"amused-venom-68\", \"DEPART\": 10, \"DUREE\": 2, \"PRIX\": 27 }, { \"VOL\": \"outstanding-anchor-64\", \"DEPART\": 10, \"DUREE\": 4, \"PRIX\": 12 }, { \"VOL\": \"blushing-tractor-25\", \"DEPART\": 11, \"DUREE\": 2, \"PRIX\": 7 }, { \"VOL\": \"hissing-pod-14\", \"DEPART\": 12, \"DUREE\": 6, \"PRIX\": 6 }, { \"VOL\": \"disturbed-sometime-36\", \"DEPART\": 14, \"DUREE\": 5, \"PRIX\": 23 }, { \"VOL\": \"outstanding-quake-72\", \"DEPART\": 15, \"DUREE\": 2, \"PRIX\": 13 }, { \"VOL\": \"condemned-rubberstamp-87\", \"DEPART\": 15, \"DUREE\": 4, \"PRIX\": 12 }, { \"VOL\": \"muddy-testosterone-79\", \"DEPART\": 16, \"DUREE\": 2, \"PRIX\": 2 }, { \"VOL\": \"delightful-king-55\", \"DEPART\": 17, \"DUREE\": 6, \"PRIX\": 3 }, { \"VOL\": \"gentle-font-91\", \"DEPART\": 19, \"DUREE\": 5, \"PRIX\": 18 }, { \"VOL\": \"mammoth-sprinter-22\", \"DEPART\": 20, \"DUREE\": 2, \"PRIX\": 23 }, { \"VOL\": \"hungry-summertime-53\", \"DEPART\": 20, \"DUREE\": 4, \"PRIX\": 13 }, { \"VOL\": \"thundering-seismograph-18\", \"DEPART\": 21, \"DUREE\": 2, \"PRIX\": 8 }, { \"VOL\": \"helpless-treat-22\", \"DEPART\": 22, \"DUREE\": 6, \"PRIX\": 5 }, { \"VOL\": \"obedient-axle-29\", \"DEPART\": 24, \"DUREE\": 5, \"PRIX\": 18 }, { \"VOL\": \"charming-bud-37\", \"DEPART\": 25, \"DUREE\": 2, \"PRIX\": 27 }, { \"VOL\": \"repulsive-telegram-81\", \"DEPART\": 25, \"DUREE\": 4, \"PRIX\": 15 }, { \"VOL\": \"proud-termite-95\", \"DEPART\": 26, \"DUREE\": 2, \"PRIX\": 9 }, { \"VOL\": \"blushing-scholarship-82\", \"DEPART\": 27, \"DUREE\": 6, \"PRIX\": 1 }, { \"VOL\": \"beautiful-rattan-33\", \"DEPART\": 29, \"DUREE\": 5, \"PRIX\": 18 }, { \"VOL\": \"raspy-cowgirl-74\", \"DEPART\": 30, \"DUREE\": 2, \"PRIX\": 27 }, { \"VOL\": \"brainy-supermarket-77\", \"DEPART\": 30, \"DUREE\": 4, \"PRIX\": 13 }, { \"VOL\": \"ancient-roadside-42\", \"DEPART\": 31, \"DUREE\": 2, \"PRIX\": 1 }, { \"VOL\": \"bloody-cartoon-19\", \"DEPART\": 32, \"DUREE\": 6, \"PRIX\": 5 }, { \"VOL\": \"quaint-figurine-27\", \"DEPART\": 34, \"DUREE\": 5, \"PRIX\": 9 }, { \"VOL\": \"clumsy-mink-8\", \"DEPART\": 35, \"DUREE\": 2, \"PRIX\": 3 }, { \"VOL\": \"vast-kickoff-3\", \"DEPART\": 35, \"DUREE\": 4, \"PRIX\": 10 }, { \"VOL\": \"impossible-radish-3\", \"DEPART\": 36, \"DUREE\": 2, \"PRIX\": 8 }, { \"VOL\": \"wrong-wife-49\", \"DEPART\": 37, \"DUREE\": 6, \"PRIX\": 4 }, { \"VOL\": \"voiceless-vocabulary-26\", \"DEPART\": 39, \"DUREE\": 5, \"PRIX\": 8 }, { \"VOL\": \"hungry-babyhood-40\", \"DEPART\": 40, \"DUREE\": 2, \"PRIX\": 3 } "
		# 	end
		# 	it { Jajascript.optimize(@data).should eq( {gain: 20, path: ["AF1", "AF2"]} ) }
		# end


		describe 'first test' do 
			before :each do 
				@data = {"VOL" => "AF514", "DEPART" => 0, "DUREE" => 1, "PRIX" =>  10}.to_json
			end
			it { Jajascript.optimize(@data).should eq( {gain: 10, path: ["AF514"]} ) }
		end
		describe 'first test with 5 nodes' do 
			before :each do 
				@data = {"VOL" => "AF514", "DEPART" => 0, "DUREE" => 5, "PRIX" =>  10}.to_json
			end
			it { Jajascript.optimize(@data).should eq( {gain: 10, path: ["AF514"]} ) }
		end
		describe 'first test 2' do 
			before :each do 
				@data = {"VOL" => "AF234", "DEPART" => 0, "DUREE" => 5, "PRIX" =>  22}.to_json
			end
			it { Jajascript.optimize(@data).should eq( {gain: 22, path: ["AF234"]} ) }
		end
		describe 'with 2 segments' do 
			before :each do 
				@data = [
					{"VOL" => "AF111", "DEPART" => 0, "DUREE" => 5, "PRIX" =>  1},
					{"VOL" => "AF222", "DEPART" => 0, "DUREE" => 5, "PRIX" =>  2}
				].to_json
			end
			it { Jajascript.optimize(@data).should eq( {gain: 2, path: ["AF222"]} ) }
		end
		describe 'with 2 chained segments' do 
			before :each do 
				@data = [
					{"VOL" => "AF111", "DEPART" => 0, "DUREE" => 3, "PRIX" =>  1},
					{"VOL" => "AF222", "DEPART" => 4, "DUREE" => 4, "PRIX" =>  2}
				].to_json
			end
			it { Jajascript.optimize(@data).should eq( {gain: 3, path: ["AF111","AF222"]} ) }
		end
		describe 'with 3 segments' do 
			before :each do 
				@data = [
					{"VOL" => "AF111", "DEPART" => 0, "DUREE" => 5, "PRIX" =>  1},
					{"VOL" => "AF222", "DEPART" => 0, "DUREE" => 10, "PRIX" => 2},
					{"VOL" => "AF333", "DEPART" => 7, "DUREE" => 2, "PRIX" =>  3}
				].to_json
			end
			it { Jajascript.optimize(@data).should eq( {gain: 4, path: ["AF111", "AF333"]} ) }
		end
  end

  describe 'ensure_nodes_contains' do
  	it 'add node' do
  		nodes = [Node.new(:id => 0)]
  		nodes = Jajascript.ensure_nodes_contains nodes, 1
  		assert_equal 2, nodes.size
  	end
  	it 'add a zero flight between nodes' do
  		nodes = [Node.new(:id => 0)]
  		nodes = Jajascript.ensure_nodes_contains nodes, 1
  		assert_equal 1, nodes.first.flights_from.size
  		flight = nodes.first.flights_from.first
  		flight.vol.should eq('0-1')
  		flight.duree.should eq(1)
  		flight.depart.should eq(0)
  		flight.prix.should eq(0)
  	end
  	it 'add several nodes' do
  		nodes = [Node.new(:id => 0)]
  		nodes = Jajascript.ensure_nodes_contains nodes, 3
  		nodes.size.should eq(4)
  		nodes[0, nodes.size-1].each do |node|
  			node.flights_from.size.should eq(1)
  		end
  		nodes[1, nodes.size].each do |node|
  			node.flights_to.size.should eq(1)
  		end
  	end
  end
  describe 'compute_price' do
  	it do 
  		plan = [Flight.new({"VOL" => "0-1", "DEPART" => 0, "DUREE" => 1, "PRIX" =>  10}), 
  						Flight.new({"VOL" => "1-2", "DEPART" => 1, "DUREE" => 2, "PRIX" =>  5})]
  		Jajascript.compute_price(plan).should eq(15)
  	end
	end
end
