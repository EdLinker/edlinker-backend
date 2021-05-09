class Edlinker::Messages < Grape::API
  helpers Edlinker::Helpers::Message
  helpers Edlinker::Helpers::User

  desc 'create message for student'
  params { use :message_params }
  post 'messages' do
    validate_teacher
    teacher = authorized_user
    current_student = User.find_by(id: params[:student_id])
    error!('User not found') unless current_student
    error!('this user has not telegram') unless current_student.telegram_data.present?
    current_student.messages.create(params[:message].merge(author_id: teacher.id, author_type: User.name))
  end

  namespace :auditoriums do
    desc 'create message for auditorium'
    params { use :message_params }
    post ':auditorium_id/messages' do
      validate_teacher
      teacher = authorized_user
      current_auditorium = Auditorium.find_by(id: params[:auditorium_id])
      error!('auditorium not found') unless current_auditorium
      current_auditorium.users.telegram_users.each do |student|
        student.messages.create(params[:message].merge(author_id: teacher.id, author_type: User.name))
      end
      'message sent to the auditorium'
    end
  end
end
