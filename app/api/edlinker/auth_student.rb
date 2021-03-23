class Edlinker::AuthStudent < Grape::API
  namespace :auth_student do
    desc 'log in'
    params do
      requires :email, type: String
      requires :password, type: String
    end
    post do
      student = Student.authenticate(params[:email], params[:password])
      payload = { student_id: student.id }
      token = JWT.encode(payload, nil, 'none')
      { token: token }
    end

    desc 'check auth'
    params do
      requires :token, type: String
    end
    get do
      student_data, _= JWT.decode params[:token], nil, false
      student = Student.find(student_data['student_id'])
      student
    end
  end
end

