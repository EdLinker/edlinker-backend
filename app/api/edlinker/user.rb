class Edlinker::User < Grape::API
  namespace :users do
    route_param :user_id do
      get do
        user = User.find(params[:user_id])
        present user, with: Edlinker::Entities::User
      end
    end
  end
end
