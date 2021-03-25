class Edlinker::AuthStudent < Grape::API
  helpers Edlinker::Helpers::Auth
  namespace :auth_student do
    desc 'log in'
    params { use :person_params }
    post do
      student = Student.authenticate(params[:email], params[:password])
      payload = { student_id: student.id }
      token = JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
      { token: token }
    end

    desc 'check auth'
    get do
      student_data, _= JWT.decode headers['Token'], nil, false
      student = Student.find(student_data['student_id'])
      student.show_json
    end
  end
end

