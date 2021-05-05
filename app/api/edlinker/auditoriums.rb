class Edlinker::Auditoriums < Grape::API
  helpers Edlinker::Helpers::Task
  helpers Edlinker::Helpers::User
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
            subject_id: group&.subject&.id,
            subject_name: group&.subject&.name,
            course_number: group&.course_number,
            student_count: group&.users&.count,
            group_leader: {
              id: group.group_leader_id,
              first_name: group.group_leader_name,
              last_name: group.group_leader_surname
            }
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
      current_teacher
      current_auditorium.tasks.create(params[:task])
    end

    get ':auditorium_id/tasks' do
      current_auditorium = Auditorium.find_by(id: params[:auditorium_id])
      error!('Auditorium not found') unless current_auditorium
      current_teacher

      current_auditorium.tasks.map do |task|
        {
          task_id: task.id,
          title: task.title,
          number: task.number,
          description: task.description,
          subject_id: task.subject&.id,
          subject_name: task.subject&.name,
          urls: task.url,
          created_at: task.created_at
        }
      end
    end
  end
end
