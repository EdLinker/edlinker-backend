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
    current_teacher = Teacher.find(params[:teacher_id])
    current_teacher.groups.includes(:students, :subject).map do |group|
      {
          auditorium_id: group.auditorium.id,
          group_id: group.id,
          group_name: group.name,
          student_count: group.students.count,
          subject: group.subject.name,
          course_number: group.course_number,
          group_leader: group.group_leader_id
      }
    end
  end
end
