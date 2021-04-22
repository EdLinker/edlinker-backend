class Edlinker::Tasks < Grape::API
  helpers Edlinker::Helpers::Task
  namespace :users do
    get ':user_id/tasks' do
      current_user = User.find_by(id: params[:user_id])
      error!('User not found') unless current_user

      current_user.tasks.map do |task|
        {
            task_id: task.id,
            auditorium_id: task.subject&.auditorium&.id,
            avatar: current_user.avatar.url,
            title: task.title,
            description: task.description,
            author: {
              user_id: current_user.id,
              first_name: current_user.first_name,
              last_name: current_user.last_name
            },
            subject_name: task.subject&.name,
            status: task.status,
            urls: task.url,
            created_at: task.created_at
        }
      end
    end

    desc 'create task'
    params { use :task_params }
    post ':user_id/tasks' do
      current_user = User.find_by(id: params[:user_id])
      error!('User not found') unless current_user
      current_user.tasks.create(params)
    end
  end

  # namespace :groups do
  #   get ':group_id/tasks'
  #
  # end
end
