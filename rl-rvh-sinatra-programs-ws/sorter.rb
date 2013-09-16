# sorter.rb
require 'sinatra'

# Usage: curl -F "info=@alpha.txt" localhost:4567/sorter
post '/sorter' do
  params[:info][:tempfile].readlines.sort
end
