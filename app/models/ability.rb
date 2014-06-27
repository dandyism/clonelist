class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :read, :all

    if user.persisted?
      can :create, Post
      can :update, Post do |post|
        post.try(:author) == user
      end
      can :destroy, Post do |post|
        post.try(:author) == user
      end
    end
  end
end
