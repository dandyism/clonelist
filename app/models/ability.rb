class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :read, :all

    if user.persisted?
      can :manage, Post, author_id: user.id
    end
  end
end
