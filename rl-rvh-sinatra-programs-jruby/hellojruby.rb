require "rubygems"
require "bundler/setup"

require "sinatra"

get '/hi' do
    "Hello JRuby World!"
end
