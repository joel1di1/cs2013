require 'spec_helper'
require 'hashdiff'

describe Scalaskel do
  describe 'change' do
	  it { Scalaskel.change(1).should eq( [{:foo => 1}] ) }
	  it { Scalaskel.change(2).should eq( [{:foo => 2}] ) }
	  it { Scalaskel.change(7).should eq( [{:foo => 7}, {:bar => 1}] ) }
	  it { Scalaskel.change(8).should eq( [{:foo => 8}, {:bar => 1, :foo => 1}] ) }
	  it { Scalaskel.change(11).should eq( [{:foo => 11}, {:bar => 1, :foo => 4}, {:qix => 1}] ) }
	  it { Scalaskel.change(14).should eq( [{:foo => 14}, {:bar => 1, :foo => 7}, {:bar => 2}, {:qix => 1, :foo => 3}] ) }
	  it { Scalaskel.change(21).should eq([
	  																			{:foo => 21},
	  																			{:bar => 1, :foo => 14},
	  																			{:bar => 2, :foo => 7},
	  																			{:bar => 3},
	  																			{:qix => 1, :foo => 10}, {:qix => 1, :bar => 1, :foo => 3}, 
																					{:baz => 1}
	  																		 ])}
	  it { Scalaskel.change(23).should eq([
	  																			{:foo => 23},
	  																			{:foo => 16, :bar => 1},
	  																			{:foo => 9, :bar => 2},
	  																			{:foo => 2, :bar => 3},
	  																			{:foo => 12, :qix => 1}, {:foo => 5, :bar => 1, :qix => 1}, 
																					{:foo => 1, :qix => 2}, {:foo => 2, :baz => 1}
	  																		 ])}
  end

end
