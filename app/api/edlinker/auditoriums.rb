class Edlinker::Auditoriums < Grape::API
  helpers Edlinker::Helpers::Task
  namespace :users do
    get ':user_id/auditoriums' do
      current_user = User.find_by(id: params[:user_id])
      error!('User not found') unless current_user

      current_user.auditoriums.map do |auditorium|
        group = auditorium.group
        {
            auditorium_id: auditorium.id,
            name: auditorium.name,
            group_id: group&.id,
            subject_name: group&.subject&.name,
            course_number: group&.course_number,
            student_count: group&.users&.count,
            group_leader_id: group&.group_leader_id
        }
      end
    end
  end

  namespace :auditoriums do
    desc 'create task for auditorium'
    params { use :task_params }
    post ':auditorium_id/tasks' do
      current_auditorium = Auditorium.find_by(id: params[:auditorium_id])
      error!('Auditorium not found') unless current_auditorium
      current_auditorium.tasks.create(params)
    end

    get ':auditorium_id/tasks' do
      current_auditorium = Auditorium.find_by(id: params[:auditorium_id])
      error!('Auditorium not found') unless current_auditorium
      current_user = User.find_by(id: params[:user_id])

      current_auditorium.tasks.map do |task|
        {
          task_id: task.id,
          auditorium_id: task.subject&.auditorium&.id,
          avatar: current_user&.avatar&.url,
          title: task.title,
          number: task.number,
          description: task.description,
          author: {
            user_id: current_user&.id,
            first_name: current_user&.first_name,
            last_name: current_user&.last_name
          },
          subject_name: task.subject&.name,
          status: task.status,
          urls: task.url,
          created_at: task.created_at
        }
      end
    end
  end
end
