class Edlinker::Auditoriums < Grape::API
  namespace :users do
    get ':user_id/auditoriums' do
      current_user = User.find(params[:user_id])
      current_user.auditoriums.includes(:users, :subject).map do |auditorium|
        {
            auditorium_id: auditorium.id,
            group_id: auditorium.group.id,
            subject: group.subject.name,
            course_number: group.course_number
        }
      end
    end
  end
end
