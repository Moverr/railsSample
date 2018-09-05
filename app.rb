 
require 'csv'
require './entities/debtsheet'

def binarygap(n)
  # write your code in Ruby 2.2
  # converstion to binary 
  binary_string  =   n.to_s(2);
  binary_arry = binary_string.split("");
  binary_gab_array = Array.new
  binary_gap = 0;
  binary_arry.each do |z|  	
  		if(z.to_i == 0 )
  		 	binary_gap += 1
  		 end

  		if(z.to_i == 1)
  			 binary_gab_array << binary_gap
  			 binary_gap = 0
  		end  	 	 
  end
  return binary_gab_array.sort().reverse()[0]
end



def sortMedicArray(debtSheetArray)
		debtSheetArray = debtSheetArray.sort! { 
   		|a, b|  
   		a.get_firstname <=> b.get_firstname 
   		a.get_lastname <=> b.get_lastname 
   	}
   	return debtSheetArray;
end

def getMedicArray(csv)
	 debtSheetArray = Array.new
	 csv.each do |record|	  
	 	medica = DebtSheet.new
	 	medica.set_firstname(record[0])
	 	medica.set_lastname(record[1])
	 	medica.set_amount(record[2])	 	
	 	debtSheetArray << medica	  
	 end
  	 debtSheetArray = sortMedicArray(debtSheetArray)
	 return debtSheetArray
end

# puts " Enter FIle URL " 
# location  = gets.to_s.strip();


location = "C:\\medic.csv"
# location = "C:\\question1.csv"

unless location.empty?
	 data_from_file = File.read(location)
	 csv = CSV.parse(data_from_file,:headers=>true)
	 debtSheetArray =  getMedicArray(csv)
	 
	 sortedArray = Array.new;

	 debtSheetArray.each do |record|
	 	item = sortedArray.find{
	 		|s| 
	 		s.get_firstname == record.get_firstname
	 		s.get_lastname == record.get_lastname
	 	}
	 	if(item != nil)
		 	sortedArray.each do |record2|
		 		if(record2.get_firstname == record.get_firstname && record2.get_lastname == record.get_lastname )
		 			record2.set_amount(record2.get_amount.to_f + record.get_amount.to_f)
		 	end
		 end
		 elsif
		 	sortedArray << record
		 end	
		 # puts " #{record.get_firstname},#{record.get_lastname}   :  #{record.get_amount} " ; 	
	 end
		puts "  ========================================================================== " ;
	  sortedArray.each do |record|
	 	puts " #{record.get_firstname},#{record.get_lastname}   :  #{record.get_amount} " ;
	  end
	 puts "End" 
end



 




# https://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html
# https://docs.ruby-lang.org/en/2.0.0/Array.html