class Edlinker::Messages < Grape::API
  helpers Edlinker::Helpers::Message
  helpers Edlinker::Helpers::User
  namespace :users do
    desc 'create message for student'
    params { use :message_params }
    post ':user_id/messages' do
      get_student
      @current_user.messages.create(params[:message])
    end
  end
end