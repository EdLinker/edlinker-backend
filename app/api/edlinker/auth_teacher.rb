class Edlinker::AuthTeacher < Grape::API
  helpers Edlinker::Helpers::Auth
  namespace :auth_teacher do
    desc 'log in'
    params { use :person_params }
    post do
      teacher = Teacher.authenticate(params[:email], params[:password])
      time = Time.now.to_i + 4 * 3600
      payload = { teacher_id: teacher.id, exp: time }
      token = JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
      { token: token }
    end

    desc 'check auth'
    get do
      begin
        teacher_data, _= JWT.decode headers['Token'], ENV['HMAC_SECRET'], true, { algorithm: 'HS256' }
        teacher = Teacher.find(teacher_data['teacher_id'])
        present teacher, with: Edlinker::Entities::Teacher
      rescue JWT::ExpiredSignature
        ['The token has expired.']
      rescue JWT::DecodeError
        ['Correct token of teacher must be passed.']
      rescue JWT::VerificationError
        ['Signature verification raised']
      end
    end
  end
end
