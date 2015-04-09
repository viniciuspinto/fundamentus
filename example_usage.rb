require 'fundamentus_data'

stocks = ['PETR4', 'BBDC4', 'PSSA3']
destination = './data'

puts "Error saving data" unless FundamentusData.save stocks, destination


