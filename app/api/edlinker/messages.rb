class Edlinker::Messages < Grape::API
  helpers Edlinker::Helpers::Message
  helpers Edlinker::Helpers::User
  namespace :users do
    desc 'create message for student'
    params { use :message_params }
    post ':student_id/messages' do
      current_student = User.find_by(id: params[:student_id])
      error!('User not found') unless current_student
      current_student.messages.create(params[:message]) if current_student.telegram_data present?
    end
  end

  desc 'create message for group'
  params { use :message_params }
  post ':group_id/messages' do
  current_group = Group.find_by(id: params[:group_id])
    current_group.users each do |student|
      student.messages.create(params[:message]) if student.telegram_data present?
    end
  end
end
