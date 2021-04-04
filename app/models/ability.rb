class Ability
  include CanCan::Ability
  after_create :assign_default_role

  def initialize(user)
    user ||= User.new

    # admin_permissions
    # teacher_permissions
    # student_permissions
    user.roles.each do |role|
      send("#{role}_permisssions")
    end

    can :read, :auth_page
  end

  private

  def admin_permissions
    can :manage, :all
  end

  def teacher_permissions
    can :manage, :message, :task, :group, :auditorium
  end

  def student_permissions
    can :manage, :message
    can :read, :task
  end

  def method_missing(*args)
    raise "#{args} role missing. Check ability.rb for more info."
  end
end
