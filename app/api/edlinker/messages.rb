class Edlinker::Messages < Grape::API
  helpers Edlinker::Helpers::Message
  helpers Edlinker::Helpers::User

  desc 'create message for student'
  params { use :message_params }
  post 'messages' do
    validate_teacher
    current_student = User.find_by(id: params[:student_id])
    error!('User not found') unless current_student
    error!('this user has not telegram') unless current_student.telegram_data.present?
    current_student.messages.create(params[:message])
  end

  namespace :groups do
    desc 'create message for group'
    params { use :message_params }
    post ':group_id/messages' do
      validate_teacher
      current_group = Group.find_by(id: params[:group_id])
      error!('group not found') unless current_group
      current_group.users.telegram_users.each do |student|
        student.messages.create(params[:message])
      end
      'message sent to the group'
    end
  end
end
