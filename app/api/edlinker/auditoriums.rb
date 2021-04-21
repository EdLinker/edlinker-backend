class Edlinker::Auditoriums < Grape::API
  namespace :users do
    get ':user_id/auditoriums' do
      current_user = User.find_by(id: params[:user_id])
      error!('User not found') unless current_user

      current_user.auditoriums.map do |auditorium|
        {
            auditorium_id: auditorium.id,
            name: auditorium.name,
            group_id: auditorium.group&.id,
            subject_name: auditorium.group&.subject&.name,
            course_number: auditorium.group&.course_number,
            student_count: auditorium.user.group,
            group_leader_id: auditorium.group&.group_leader_id
        }
      end
    end
  end
end
