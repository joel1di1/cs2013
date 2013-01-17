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


		describe 'first test' do 
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
  		assert_equal 1, nodes.first.flights.size
  		flight = nodes.first.flights.first
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
  			node.flights.size.should eq(1)
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
