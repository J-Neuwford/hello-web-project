require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end 

  get '/names' do
    names = params[:names]

    return names
  end

  post '/sorted-names' do
    names = params[:names]

    return names.split(',').sort.join(',')
  end

  post '/string-repeater' do
    string = params[:string]
    repeat_count = params[:repeat_count]
    result = []

    repeat_count.to_i.times do |x|
      result << string
    end

    return result.join("")
    
  end
end