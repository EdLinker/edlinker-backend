class Ability
  include CanCan::Ability

  def initialize
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :teacher
      can :manage, :message, :task, :group, :auditorium
    elsif user.has_role? :student
      can :manage, :message
      can :read, :task
    else
      can :read, :auth_page
    end
  end
end