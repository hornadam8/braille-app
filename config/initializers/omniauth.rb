#Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :canvas, APP_CONFIG['canvas_client_id'], APP_CONFIG['canvas_client_secret'],
#  {
  #  :client_options => {
#    :site => APP_CONFIG['canvas_host']
  #  }
#  }
#end

#OmniAuth.config.before_request_phase do |env|
  #request = Rack::Request.new(env)
  #state = "#{SecureRandom.hex(24)}#{DateTime.now.to_i}"
  #OauthState.create!(state: state, payload: request.params.to_json)
  #env["omniauth.strategy"].options[:authorize_params].state = state

  # Bye default omniauth will store all params in the session. The code above
  # stores the values in the database so we remove the values from the session
  # since the amount of data in the original params object will overflow the
  # allowed cookie size
  #env["rack.session"].delete("omniauth.params")
#end
Dotenv.load
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
