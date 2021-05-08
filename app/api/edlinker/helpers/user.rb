module Edlinker::Helpers::User
  extend Grape::API::Helpers

  def authorized_user
    user_data, _= JWT.decode headers['Token'], ENV['HMAC_SECRET'], true, { algorithm: 'HS256' }
    User.find_by(id: user_data['user_id'])
  end

  def validate_student
    current_user = authorized_user
    error!('User not found') unless current_user
    error!('Current user is not student') unless current_user.has_role?(:student)
  end

  def validate_teacher
    current_user = authorized_user
    error!('User not found') unless current_user
    error!('Current user is not teacher') unless current_user.has_role?(:teacher)
  end
end
