class Edlinker::User < Grape::API
  namespace :users do
    route_param :user_id do
      get do
        user = User.find(params[:user_id])
        present user, with: Edlinker::Entities::User
      rescue ActiveRecord::RecordNotFound
        ['User_id is incorrect. Please, pass correct user_id']
      end
    end
  end
end
