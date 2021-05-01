module Edlinker::Helpers::User
  extend Grape::API::Helpers
  def get_student
    @current_user = User.find_by(id: params[:user_id])
    error!('User not found') unless @current_user
    error!('Current user is not student') unless @current_user.has_role?(:student)
  end

  def get_teacher
    @current_user = User.find_by(id: params[:user_id])
    error!('User not found') unless @current_user
    error!('Current user is not teacher') unless @current_user.has_role?(:teacher)
  end
end