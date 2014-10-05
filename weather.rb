require 'sinatra'
require 'yahoo_weatherman'



client = Weatherman::Client.new


get '/' do
    erb :home
end

post '/weather' do
  @post = params[:post]['location']

  @weather = (client.lookup_by_location(@post).condition['temp'] * 9) /5 +32
  @condition = weather = client.lookup_by_location(@post).condition['text']
  "#{@weather}"
  "#{@condition}"
    if (@condition > 'Sunny')
        erb :sunny
    elsif (@condition <= 'Fair')
        erb :sunny
    elsif (@condition <= 'Cloudy')
        erb :cloudy
    elsif (@condition <= 'Rain')
        erb :rain
      elsif (@condition <= ' Light Rain')
        erb :rain
    elsif (@condition <= 'Mostly Cloudy')
        erb :cloudy
    elsif (@condition <= 'Snowy')
        erb :snowy
    else
        erb :default
    end
end
