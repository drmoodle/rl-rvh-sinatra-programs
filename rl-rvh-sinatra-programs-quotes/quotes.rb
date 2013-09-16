require 'sinatra' # should be the first line
require 'open-uri'
require 'csv'
# By default error will catch Sinatra::ServerError
# Sinatra will pass you the error via the „sinatra.error‟
# in request.env
error do
  e = request.env['sinatra.error']
  puts e.to_s
  puts e.backtrace.join("\n")
  "Application error"
end
#class
class Stock
  def initialize(symbol)
    @symbol = symbol.upcase
    puts @symbol
    get_info
end
  attr_reader :row0, :row1, :row2, :row3, :row4, :row5, :row6,
:row7
  private
    #Get info about specific stock
    def get_info
      url = "http://download.finance.yahoo.com/d/quotes.csv?s=#{@symbol}&f=sl1d1t1c1ohgv&e=.csv"
      csv = CSV.parse(open(url).read)
      #parse csv data
      csv.each do |row|
        @row0 = row[0]
        @row1 = row[1]
        @row2 = row[2]
        @row3 = row[3]
        @row4 = row[4]
        @row5 = row[5]
        @row6 = row[6]
        @row7 = row[7]
      end 
    end
end

# Get new Stock Symbol
get '/' do
  erb :new 
end

# Display stock details
get '/show' do
  @stock = Stock.new(params[:symbol])
  erb :show 
end
