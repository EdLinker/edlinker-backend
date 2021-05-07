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
      student_ids = []
      current_group = Group.find_by(id: params[:group_id])
      error!('group not found') unless current_group
      current_group.users.each do |student|
        if student.telegram_data.present?
          student.messages.create(params[:message])
        else
          student_ids << student.id
        end
      end
      return "these students have no telegram: #{student_ids}" if student_ids.empty?
      'success'
    end
  end
end
