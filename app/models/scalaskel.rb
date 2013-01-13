class Scalaskel < ActiveRecord::Base
	FOO = 1
	BAR = 7
	QIX = 11
	BAZ = 21

  # attr_accessible :title, :body
  def self.change(amount)
  	res = change_in_devises(amount, :baz, :qix, :bar, :foo)
  	res.map{ |hash| hash.reject{ |k,v| v == 0} }
  end

  def self.change_in_devises(amount, *devises)
  	return [{:foo => amount}] if devises.size == 1

  	devise = devises.first
  	value  = sym_to_const_value devise
  	devise_array  = init_array(amount / value)
  	res = devise_array.map do |i| 
  		next_devises = devises.slice(1, devises.count).flatten
  		sub_array = change_in_devises(amount - i*value, *next_devises)
  		sub_array.map do |hash|
  			hash.merge({devise => i})
  		end
  	end
  	res.flatten
  end

  def self.init_array(n)
  	Array.new(n+1) { |i| i }
  end

  def self.sym_to_const_value sym
  	("Scalaskel::"+(sym.to_s.upcase)).constantize
  end

end
