class Edlinker::Auditoriums < Grape::API
  namespace :users do
    get ':user_id/auditoriums' do
      current_user = User.find_by(id: params[:user_id])
      error!('User not found') unless current_user

      current_user.auditoriums.map do |auditorium|
        group = auditorium.group
        {
            auditorium_id: auditorium.id,
            name: auditorium.name,
            group_id: group&.id,
            subject_name: group&.subject&.name,
            course_number: group&.course_number,
            student_count: group&.users.count,
            group_leader_id: group&.group_leader_id
        }
      end
    end
  end
end
