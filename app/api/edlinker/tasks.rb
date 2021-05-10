class Edlinker::Tasks < Grape::API
  helpers Edlinker::Helpers::Task
  helpers Edlinker::Helpers::User

  get 'tasks' do
    current_user = authorized_user
    error!('User not found') unless current_user
    current_user.tasks.page(params[:page]).map do |task|
      {
          task_id: task.id,
          auditorium_id: task.subject&.auditorium&.id,
          avatar: current_user.avatar.url,
          title: task.title,
          number: task.number,
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

  desc 'create task for user'
  params { use :task_params }
  post 'tasks' do
    validate_teacher
    teacher = authorized_user
    student = User.find_by(id: params[:student_id])
    student.tasks.create!(params[:task].merge(author_id: teacher.id))
  end

  desc 'update task status'
  params do
    requires :status, type: Integer
  end
  put 'tasks/:task_id' do
    current_student = authorized_user
    error!('User not found') unless current_student
    task = current_student.tasks.find_by(id: params[:task_id])
    error!('task not found') unless task
    task.change_status(params[:status].to_i)
    task
  end

  params do
    requires :number, type: Integer
  end
  get 'users_task' do
    validate_teacher
    current_user = authorized_user
    error!('User not found') unless current_user
    users_with_task = User.joins(:tasks).includes(:group).where('tasks.number = ?', params[:number]).pluck('users.id', 'users.first_name', 'users.last_name', 'tasks.status', 'groups.name')
    users_with_task.map do |id, first_name, last_name, status, group_name|
      { id: id, first_name: first_name, last_name: last_name, status: status, group_name: group_name }
    end
  end
end


