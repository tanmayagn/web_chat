class WebChatsController < ApplicationController
  def index
	@client = Twilio::REST::Client.new('AC44c5a45ea7bbd1817a58465cab10e83d', 'cf01ac9108a0be42471f9c92c3f117bd')
	  token = Twilio::JWT::AccessToken.new(
      'AC44c5a45ea7bbd1817a58465cab10e83d',
      'SK482ed11135ee3129daa93f47b2875de5',
      '9qKJvKfZI1jPSSiWLW6uKTolMgsmvd6I',
      [],
      identity: SecureRandom.uuid
    )
    grant = Twilio::JWT::AccessToken::ChatGrant.new
    grant.service_sid = 'IS0439031acecb4bda853bb1c7cd8940cb'
    token.add_grant(grant)

    @token = token.to_jwt
    # render json:@token
  end
end
