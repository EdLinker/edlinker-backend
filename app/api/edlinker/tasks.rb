class Edlinker::Tasks < Grape::API
  helpers do
    def declared_params
      declared(params, include_missing: false)
    end
  end
  params do
    requires :user_id
  end

  namespace :users do
    get ':user_id/tasks' do
      current_user = User.find(params[:user_id])
      current_user.tasks.map do |task|
        {
            description: task.description,
            status: task.status,
            urls: task.url,
            created_at: task.created_at
        }
      end
    end
  end
end
