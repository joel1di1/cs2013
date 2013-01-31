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

		describe 'test with lots of data' do
			before :each do 
				prng = Random.new(1234)
				@data = []
				max_node = 100
				(1..max_node).each do |i|
					@data << {'VOL' => "node-#{i}", 'DEPART' => prng.rand(0..max_node), 'DUREE' => prng.rand(1..20), 'PRIX' => prng.rand(1..50)}
				end
				@data = @data.to_json
			end
			it { Jajascript.optimize(@data).should eq( {gain: 20, path: ["AF1", "AF2"]} ) }
		end


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
		describe 'test same neo' do 
			before :each do 
				@data = '{ "VOL": "VOL0", "DEPART": 84, "DUREE": 4, "PRIX": 86 },{ "VOL": "VOL1", "DEPART": 45, "DUREE": 9, "PRIX": 68 },{ "VOL": "VOL2", "DEPART": 36, "DUREE": 2, "PRIX": 58 },{ "VOL": "VOL3", "DEPART": 77, "DUREE": 5, "PRIX": 67 },{ "VOL": "VOL4", "DEPART": 0, "DUREE": 1, "PRIX": 45 },{ "VOL": "VOL5", "DEPART": 42, "DUREE": 2, "PRIX": 70 },{ "VOL": "VOL6", "DEPART": 23, "DUREE": 11, "PRIX": 43 },{ "VOL": "VOL7", "DEPART": 75, "DUREE": 3, "PRIX": 49 },{ "VOL": "VOL8", "DEPART": 56, "DUREE": 7, "PRIX": 5 },{ "VOL": "VOL9", "DEPART": 75, "DUREE": 11, "PRIX": 25 },{ "VOL": "VOL10", "DEPART": 67, "DUREE": 3, "PRIX": 95 },{ "VOL": "VOL11", "DEPART": 58, "DUREE": 11, "PRIX": 1 },{ "VOL": "VOL12", "DEPART": 27, "DUREE": 10, "PRIX": 16 },{ "VOL": "VOL13", "DEPART": 45, "DUREE": 9, "PRIX": 24 },{ "VOL": "VOL14", "DEPART": 30, "DUREE": 1, "PRIX": 68 },{ "VOL": "VOL15", "DEPART": 50, "DUREE": 7, "PRIX": 1 },{ "VOL": "VOL16", "DEPART": 21, "DUREE": 11, "PRIX": 96 },{ "VOL": "VOL17", "DEPART": 49, "DUREE": 5, "PRIX": 33 },{ "VOL": "VOL18", "DEPART": 39, "DUREE": 6, "PRIX": 34 },{ "VOL": "VOL19", "DEPART": 18, "DUREE": 3, "PRIX": 36 },{ "VOL": "VOL20", "DEPART": 76, "DUREE": 5, "PRIX": 79 },{ "VOL": "VOL21", "DEPART": 3, "DUREE": 2, "PRIX": 51 },{ "VOL": "VOL22", "DEPART": 25, "DUREE": 1, "PRIX": 61 },{ "VOL": "VOL23", "DEPART": 2, "DUREE": 12, "PRIX": 94 },{ "VOL": "VOL24", "DEPART": 72, "DUREE": 3, "PRIX": 21 },{ "VOL": "VOL25", "DEPART": 26, "DUREE": 6, "PRIX": 59 },{ "VOL": "VOL26", "DEPART": 56, "DUREE": 2, "PRIX": 46 },{ "VOL": "VOL27", "DEPART": 50, "DUREE": 4, "PRIX": 47 },{ "VOL": "VOL28", "DEPART": 13, "DUREE": 1, "PRIX": 21 },{ "VOL": "VOL29", "DEPART": 59, "DUREE": 6, "PRIX": 50 },{ "VOL": "VOL30", "DEPART": 20, "DUREE": 6, "PRIX": 97 },{ "VOL": "VOL31", "DEPART": 24, "DUREE": 10, "PRIX": 17 },{ "VOL": "VOL32", "DEPART": 17, "DUREE": 9, "PRIX": 66 },{ "VOL": "VOL33", "DEPART": 35, "DUREE": 12, "PRIX": 99 },{ "VOL": "VOL34", "DEPART": 71, "DUREE": 4, "PRIX": 3 },{ "VOL": "VOL35", "DEPART": 17, "DUREE": 3, "PRIX": 68 },{ "VOL": "VOL36", "DEPART": 39, "DUREE": 8, "PRIX": 66 },{ "VOL": "VOL37", "DEPART": 14, "DUREE": 1, "PRIX": 73 },{ "VOL": "VOL38", "DEPART": 3, "DUREE": 3, "PRIX": 66 },{ "VOL": "VOL39", "DEPART": 21, "DUREE": 11, "PRIX": 8 },{ "VOL": "VOL40", "DEPART": 2, "DUREE": 5, "PRIX": 62 },{ "VOL": "VOL41", "DEPART": 22, "DUREE": 12, "PRIX": 29 },{ "VOL": "VOL42", "DEPART": 43, "DUREE": 11, "PRIX": 83 },{ "VOL": "VOL43", "DEPART": 22, "DUREE": 6, "PRIX": 47 },{ "VOL": "VOL44", "DEPART": 53, "DUREE": 6, "PRIX": 85 },{ "VOL": "VOL45", "DEPART": 75, "DUREE": 5, "PRIX": 22 },{ "VOL": "VOL46", "DEPART": 43, "DUREE": 4, "PRIX": 59 },{ "VOL": "VOL47", "DEPART": 60, "DUREE": 11, "PRIX": 84 },{ "VOL": "VOL48", "DEPART": 27, "DUREE": 1, "PRIX": 30 },{ "VOL": "VOL49", "DEPART": 40, "DUREE": 4, "PRIX": 45 },{ "VOL": "VOL50", "DEPART": 60, "DUREE": 9, "PRIX": 47 },{ "VOL": "VOL51", "DEPART": 33, "DUREE": 4, "PRIX": 52 },{ "VOL": "VOL52", "DEPART": 23, "DUREE": 7, "PRIX": 21 },{ "VOL": "VOL53", "DEPART": 36, "DUREE": 1, "PRIX": 60 },{ "VOL": "VOL54", "DEPART": 11, "DUREE": 6, "PRIX": 25 },{ "VOL": "VOL55", "DEPART": 9, "DUREE": 5, "PRIX": 36 },{ "VOL": "VOL56", "DEPART": 44, "DUREE": 6, "PRIX": 10 },{ "VOL": "VOL57", "DEPART": 0, "DUREE": 12, "PRIX": 58 },{ "VOL": "VOL58", "DEPART": 57, "DUREE": 11, "PRIX": 98 },{ "VOL": "VOL59", "DEPART": 2, "DUREE": 11, "PRIX": 40 },{ "VOL": "VOL60", "DEPART": 3, "DUREE": 4, "PRIX": 49 },{ "VOL": "VOL61", "DEPART": 45, "DUREE": 11, "PRIX": 50 },{ "VOL": "VOL62", "DEPART": 33, "DUREE": 11, "PRIX": 1 },{ "VOL": "VOL63", "DEPART": 49, "DUREE": 5, "PRIX": 23 },{ "VOL": "VOL64", "DEPART": 23, "DUREE": 12, "PRIX": 62 },{ "VOL": "VOL65", "DEPART": 51, "DUREE": 4, "PRIX": 22 },{ "VOL": "VOL66", "DEPART": 36, "DUREE": 4, "PRIX": 50 },{ "VOL": "VOL67", "DEPART": 46, "DUREE": 1, "PRIX": 83 },{ "VOL": "VOL68", "DEPART": 63, "DUREE": 8, "PRIX": 25 },{ "VOL": "VOL69", "DEPART": 83, "DUREE": 10, "PRIX": 95 },{ "VOL": "VOL70", "DEPART": 55, "DUREE": 4, "PRIX": 37 },{ "VOL": "VOL71", "DEPART": 82, "DUREE": 9, "PRIX": 92 },{ "VOL": "VOL72", "DEPART": 10, "DUREE": 8, "PRIX": 14 },{ "VOL": "VOL73", "DEPART": 11, "DUREE": 9, "PRIX": 87 },{ "VOL": "VOL74", "DEPART": 3, "DUREE": 12, "PRIX": 8 },{ "VOL": "VOL75", "DEPART": 17, "DUREE": 5, "PRIX": 93 },{ "VOL": "VOL76", "DEPART": 54, "DUREE": 3, "PRIX": 30 },{ "VOL": "VOL77", "DEPART": 26, "DUREE": 10, "PRIX": 59 },{ "VOL": "VOL78", "DEPART": 10, "DUREE": 1, "PRIX": 51 },{ "VOL": "VOL79", "DEPART": 36, "DUREE": 9, "PRIX": 8 },{ "VOL": "VOL80", "DEPART": 41, "DUREE": 8, "PRIX": 3 },{ "VOL": "VOL81", "DEPART": 62, "DUREE": 9, "PRIX": 7 },{ "VOL": "VOL82", "DEPART": 31, "DUREE": 9, "PRIX": 91 },{ "VOL": "VOL83", "DEPART": 82, "DUREE": 12, "PRIX": 0 },{ "VOL": "VOL84", "DEPART": 48, "DUREE": 12, "PRIX": 55 },{ "VOL": "VOL85", "DEPART": 66, "DUREE": 4, "PRIX": 35 },{ "VOL": "VOL86", "DEPART": 30, "DUREE": 7, "PRIX": 45 },{ "VOL": "VOL87", "DEPART": 22, "DUREE": 3, "PRIX": 24 },{ "VOL": "VOL88", "DEPART": 7, "DUREE": 11, "PRIX": 23 },{ "VOL": "VOL89", "DEPART": 80, "DUREE": 8, "PRIX": 19 },{ "VOL": "VOL90", "DEPART": 55, "DUREE": 4, "PRIX": 93 },{ "VOL": "VOL91", "DEPART": 15, "DUREE": 12, "PRIX": 51 },{ "VOL": "VOL92", "DEPART": 28, "DUREE": 1, "PRIX": 39 },{ "VOL": "VOL93", "DEPART": 57, "DUREE": 11, "PRIX": 39 },{ "VOL": "VOL94", "DEPART": 61, "DUREE": 10, "PRIX": 40 },{ "VOL": "VOL95", "DEPART": 41, "DUREE": 3, "PRIX": 58 },{ "VOL": "VOL96", "DEPART": 53, "DUREE": 5, "PRIX": 62 },{ "VOL": "VOL97", "DEPART": 84, "DUREE": 6, "PRIX": 94 },{ "VOL": "VOL98", "DEPART": 30, "DUREE": 11, "PRIX": 63 },{ "VOL": "VOL99", "DEPART": 64, "DUREE": 5, "PRIX": 59 }'
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
