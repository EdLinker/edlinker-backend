class Edlinker::AuthStudent < Grape::API
  helpers Edlinker::Helpers::Auth
  namespace :auth_student do
    desc 'log in'
    params { use :person_params }
    post do
      student = Student.authenticate(params[:email], params[:password])
      time = Time.now.to_i + 4 * 3600
      payload = { student_id: student.id, exp: time }
      token = JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
      { token: token }
    end

    desc 'check auth'
    get do
      begin
        student_data, _= JWT.decode headers['Token'], ENV['HMAC_SECRET'], true, { algorithm: 'HS256' }
        student = Student.find(student_data['student_id'])
        present student, with: Edlinker::Entities::Student
      rescue JWT::ExpiredSignature
        ['The token has expired.']
      rescue JWT::DecodeError
        ['Correct token of student must be passed.']
      rescue JWT::VerificationError
        ['Signature verification raised']
      end
    end
  end
end
