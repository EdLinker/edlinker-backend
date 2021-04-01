class Edlinker::Groups < Grape::API
  helpers do
    def declared_params
      declared(params, include_missing: false)
    end
  end
  params do
    requires :teacher_id
  end
  get ':teacher_id/auditoriums' do
    current_teacher = User.find(params[:teacher_id])
    current_teacher.groups.includes(:students, :subject).map do |group|
      {
          group_name: group.name,
          student_count: group.students.count,
          subject: group.subject.name,
          course_number: group.course_number,
          group_leader: group.group_leader_id
      }
    end
  end
end
