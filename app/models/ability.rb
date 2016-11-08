class Ability
  include CanCan::Ability

  def initialize(user)
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
    
    alias_action :update, :destroy, :to => :modify

    if user.role? :unconfirmed
    end
    if user.role? :user
      can :read, Location, :customer_id => user.customer_id
      can :read, Probe, :customer_id => user.customer_id
      can :read, Customer, :id => user.customer_id
      can :read, User, :customer_id => user.customer_id
      can :read, ProbeType do |pt|
        pt.probes.any? { |p| p.customer_id == user.customer_id }
      end
    end
    if user.role? :manager
      can :modify, Location, :customer_id => user.customer_id
      can :modify, Probe, :customer_id => user.customer_id
      can :modify, User, :customer_id => user.customer_id
    end
    if user.role? :superadmin
      can :read, :all
      can :manage, :all
    end    
  end
end
