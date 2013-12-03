require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-drdb'

class App < Sinatra::Base
  get '/' do
    redirect '/auth/drdb'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    auth = request.env["omniauth.auth"]
    MultiJson.encode(auth)
     
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  token  = "BSvYuvtvK2IMI4FCkuh7li0wx2HLsJgRNjPkj6iK"
  secret = "nKhcGUsdtlMw9yG9zPXWLq54JZcASvcdlCyeiWWm"

  provider :drdb, token, secret
end

run App.new
