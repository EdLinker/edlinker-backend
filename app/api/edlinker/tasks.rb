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
      current_user.tasks.includes(:messages).map do |task|
        assignment = task.messages.first
        {
            author: assignment.author,
            description: task.description,
            posted_at: task.created_at,
            body: assignment.body,
            link: assignment.url,
        }
      end
    end
  end
end
