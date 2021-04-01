# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, public: true

    if user.present?  # additional permissions for logged in users (they can read their own posts)
      can :read, Post, user_id: user.id

      if user.admin?  # additional permissions for administrators
        can :read, Post
      end
    end
  end
end



class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user_signed_in?
      if user.try(:profile).present? && user.profile.has_role?(:student)
        student
      else
        authenticated
      end
    else
      anonymous
    end
  end

  def anonymous
    can :read, Project, {:active => true, :closed => false, :sweep => { :disclosure => { :allusers => true } } }
  end

  def authenticated
    anonymous
    can :crud, Profile, :user_id => user.id #[for themselves]
  end

  def student
    authenticated
  end

  def teacher
    authenticated
  end
end

def initialize(user)
  alias_action :create, :read, :update, :destroy, :to => :crud
  user ||= User.new

  #Only same user can mange his Profile
  can :manage, [Profile], :user_id => user.id

  #Give rule wise permission
  if user.has_role? :admin_user
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