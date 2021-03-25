class Edlinker::AuthTeacher < Grape::API
  helpers Edlinker::Helpers::Auth
  namespace :auth_teacher do
    desc 'log in'
    params { use :person_params }
    post do
      teacher = Teacher.authenticate(params[:email], params[:password])
      payload = { teacher_id: teacher.id }
      token = JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
      { token: token }
    end

    desc 'check auth'
    get do
      teacher_data, _= JWT.decode headers['Token'], nil, false
      teacher = Teacher.find(teacher_data['teacher_id'])
      teacher.show_json
    end
  end
end


