def Calculator
	 attr_accessor :num1,:num2
	 def initialize
	 end
	 def add()
	 	return @num1 + @num2
	 end
end

cac = Calculator.new
cac.num1 = 20
cac.num2 = 2
puts cac.add
