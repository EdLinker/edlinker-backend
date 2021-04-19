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
            auditorium_id: group.auditorium.id,
            avatar: current_user.avatar.url,
            title: task.title,
            description: task.description,
            author: {user_id: current_user.id, first_name: current_user.first_name, last_name: current_user.last_name},
            subject_name: task.subject&.name,
            status: task.status,
            urls: task.url,
            created_at: task.created_at
        }
      end
    end
  end
end
