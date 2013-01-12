require 'spec_helper'

describe Scalaskel do
  describe 'change' do
	  it { Scalaskel.change(1).should eq( [{:foo => 1}] ) }
	  it { Scalaskel.change(2).should eq( [{:foo => 2}] ) }
	  it { Scalaskel.change(7).should eq( [{:foo => 7}, {:bar => 1}] ) }
	  it { Scalaskel.change(8).should eq( [{:foo => 8}, {:bar => 1, :foo => 1}] ) }
	  it { Scalaskel.change(11).should eq( [{:foo => 11}, {:bar => 1, :foo => 4}, {:qix => 1}] ) }

	  it { Scalaskel.change(14).should eq( [{:foo => 14}, {:bar => 1, :foo => 7}, {:bar => 2}, {:qix => 1, :foo => 3}] ) }
  end

  # describe 'change_in_devises' do 
	 #  it { Scalaskel.change_in_devises(1, :foo).should eq( [{:foo => 1}] ) }
  # end

end
