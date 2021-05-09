class Edlinker::Auditoriums < Grape::API
  helpers Edlinker::Helpers::Task
  helpers Edlinker::Helpers::User

  get 'auditoriums' do
    current_user = authorized_user
    error!('User not found') unless current_user
    current_user.auditoriums.map do |auditorium|
      auditorium.groups.map do |group|
        {
            auditorium_id: auditorium.id,
            name: auditorium.name,
            group_id: group&.id,
            subject_name: group&.subject&.name,
            subject_id: group&.subject&.id,
            course_number: group&.course_number,
            #student_count: auditorium&.groups&.users&.count,
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
      validate_teacher
      teacher = authorized_user
      current_auditorium = Auditorium.find_by(id: params[:auditorium_id])
      error!('Auditorium not found') unless current_auditorium
      current_auditorium.users.each do |user|
        user.tasks.create(params[:task].merge(auditorium_id: current_auditorium.id, author_id: teacher.id))
      end
      'task created successfully'
    end

    get ':auditorium_id/tasks' do
      current_auditorium = Auditorium.find_by(id: params[:auditorium_id])
      error!('Auditorium not found') unless current_auditorium

      current_auditorium.tasks.map do |task|
        {
          task_id: task.id,
          title: task.title,
          number: task.number,
          description: task.description,
          subject_name: task.subject&.name,
          urls: task.url,
          created_at: task.created_at
        }
      end
    end
  end
end

