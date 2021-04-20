class Edlinker::Auditoriums < Grape::API
  namespace :users do
    get ':user_id/auditoriums' do
      current_user = User.find_by(id: params[:user_id])
      error!('User not found') unless current_user

      current_user.auditoriums.includes(:users, :subject).map do |auditorium|
        {
            auditorium_id: auditorium.id,
            group_id: auditorium.group.id,
            subject: auditorium.group.subject.name,
            course_number: auditorium.group.course_number
        }
      end
    end
  end
end
