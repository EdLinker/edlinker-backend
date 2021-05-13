class Edlinker::Auditoriums < Grape::API
  helpers Edlinker::Helpers::Task
  helpers Edlinker::Helpers::User

  get 'auditoriums' do
    validate_teacher
    current_user = authorized_user
    error!('User not found') unless current_user
    current_user.auditoriums.map do |auditorium|
          {
              auditorium_id: auditorium.id,
              name: auditorium.name,
              subject_name: auditorium&.subject&.name,
              subject_id: auditorium&.subject&.id,
          }
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
      current_auditorium.groups.each do |group|
        group.users.each do |user|
          user.tasks.create(params[:task].merge(auditorium_id: current_auditorium.id, author_id: teacher.id))
        end
      end
      'task created successfully'
    end

    get ':auditorium_id/tasks' do
      validate_teacher
      teacher = authorized_user
      current_auditorium = Auditorium.find_by(id: params[:auditorium_id])
      error!('Auditorium not found') unless current_auditorium

      current_auditorium.tasks.map do |task|
        {
          title: task.title,
          number: task.number,
          description: task.description,
          subject_name: task.subject&.name,
          urls: task.url,
          author: {
            name: teacher.first_name,
            surname: teacher.last_name
          }
         }
      end.uniq
    end
  end
end

