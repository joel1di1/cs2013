class Scalaskel < ActiveRecord::Base
	BAR = 7
	QIX = 11
	BAZ = 21

  # attr_accessible :title, :body
  def self.change(amount)
  	qix_count = amount / QIX
  	qixs = init_array qix_count
  	res = qixs.map do |i| 
  		hash_base = {:qix => i}
  		foo_bars = change_bars(amount - (QIX * i))
  		foo_bars.map{|hash| hash.merge(hash_base)}
  	end

  	res.flatten.map{|hash| hash.reject{|k,v| v == 0} } 
  end

  def self.change_bars(amount)
  	bar_count = amount / BAR
  	bars =init_array bar_count
  	bars.map{ |i| {:bar => i, :foo => amount - (BAR * i)} }
  end

  def self.init_array(n)
  	Array.new(n+1) { |i| i }
  end

end
