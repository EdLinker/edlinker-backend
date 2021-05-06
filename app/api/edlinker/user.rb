class Edlinker::User < Grape::API
  helpers Edlinker::Helpers::Auth
  helpers Edlinker::Helpers::User

    desc 'add students by teacher'
    params { use :person_params }
    post ':add_student' do
      validate_teacher
      user = User.new(email: params[:email], phone_number: params[:phone_number], first_name: params[:first_name],
                      last_name: params[:last_name], patronymic: params[:patronymic])
      user.password = params[:password]
      user.add_role(:student)
      user.save!
      error!('Invalid username or password') unless user.present?
      payload = { user_id: user.id }
      token = JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
      { token: token }
    end

  namespace :users do
    route_param :user_id do
      get do
        user = User.find_by(id: params[:user_id])
        error!('User not found') unless user
        present user, with: Edlinker::Entities::User
      end
    end

    params do
      requires :page, type: Integer
    end

    get do
      @users = User.order(:last_name).page(params[:page])
    end
  end
end
