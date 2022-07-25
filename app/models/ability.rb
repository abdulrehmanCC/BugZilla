# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||=User.new
    if user.developer?
      can :manage, Bug, :user_id => user.id
      can :manage, Bug, :developer_id => user.id
      can :read, Project
    end

    if user.manager?
      can :manage, :all
      # can :manage, Bug, :user_id => user.id
      # can :manage, Bug, :developer_id => user.id
      # can :manage, Project
    end


    if user.qa?
      can :manage, Bug, :user_id => user.id
      can :manage, Bug, :developer_id => user.id
      can :read, Project
    end

  end
end
