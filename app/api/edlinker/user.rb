class Edlinker::User < Grape::API
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
