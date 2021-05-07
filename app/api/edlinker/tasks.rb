class Edlinker::Tasks < Grape::API
  helpers Edlinker::Helpers::Task
  helpers Edlinker::Helpers::User

  get 'tasks' do
    current_user = authorized_user
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
    current_user = authorized_user
    validate_teacher
    current_user.tasks.create!(params[:task])
  end

  desc 'update task status'
  params do
    requires :status, type: Integer
    requires :student_id, type: Integer
  end

  put 'tasks/:task_id' do
    current_student = User.find_by(id: params[:student_id])
    error!('User not found') unless current_student
    task = current_student.tasks.find_by(id: params[:task_id])
    error!('task not found') unless task
    task.change_status(params[:status].to_i)
    task
  end
end


