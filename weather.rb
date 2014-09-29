require 'sinatra'
require 'yahoo_weatherman'



client = Weatherman::Client.new


get '/' do
    erb :home
end

post '/weather' do
  @post = params[:post]['location']

  @weather = (client.lookup_by_location(@post).condition['temp'] * 9) /5 +32

  "#{@weather}"
   if (@weather > 80)
        erb :hot
    elsif (@weather <= 60)
        erb :cold
    elsif (@weather <= 32)
        erb :freezing
    elsif (@weather < 80)
        erb :normal
    else
        erb :default
    end
end
