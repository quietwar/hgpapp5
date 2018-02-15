class Ability
  include CanCan::Ability

  def initialize(user)

    can :manage, Admin
    can :read, User
    can :manage, User, id: user.id
    can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: :admin
  end

end
    #case user.roles
    #   when 'user'
    #     can :read, ActiveAdmin::Page, :name => "Dashboard"
    #     can :manage, Project, user_id: user.id
    #     user ||= User.new
    # if user.has_role? :admin
    #   can :manage, :all
    # elsif user.has_role? :superadmin
    #   can :create, Project
    #   can :update, Project
    #   can :read, :all
    # else
    #   can :read, :all
    # end
  #end
    #
    #   when 'admin'
    #     can :manage, ActiveAdmin::Page, :name => "Dashboard"
    #     can :assign_roles, User if user.admin?
    #   when 'super-admin'
    #     can :manage, :all
    # end

#   end
# end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
