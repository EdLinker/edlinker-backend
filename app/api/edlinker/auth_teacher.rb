class Edlinker::AuthTeacher < Grape::API
  namespace :auth_teacher do
    desc 'log in'
    params do
      requires :email, type: String
      requires :password, type: String
    end
    post do
      teacher = Teacher.authenticate(params[:email], params[:password])
      payload = { teacher_id: teacher }
      token = JWT.encode payload, nil, 'none'
      { token: token }
    end

    desc 'check auth'
    params do
      requires :token, type: String
    end
    get do
      teacher_data, _= JWT.decode params[:token], nil, false
      teacher = teacher.find(teacher_data['teacher_id'])
      teacher
    end
  end
end


