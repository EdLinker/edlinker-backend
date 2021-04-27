class Edlinker::Auth < Grape::API
  helpers Edlinker::Helpers::Auth
  namespace :auth do
    desc 'log in'
    params { use :person_params }
    post do
      user = User.authenticate(params[:email], params[:password])
      time = Time.now.to_i + 168 * 3600
      payload = { user_id: user.id, exp: time }
      token = JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
      { token: token }
    end

    desc 'check auth'
    get do
      begin
        user_data, _= JWT.decode headers['Token'], ENV['HMAC_SECRET'], true, { algorithm: 'HS256' }
        user = User.find(user_data['user_id'])
        present user, with: Edlinker::Entities::User
      rescue JWT::ExpiredSignature
        ['The token has expired.']
      rescue JWT::DecodeError
        ['Correct token must be passed.']
      rescue JWT::VerificationError
        ['Signature verification raised']
      end
    end
  end
end
