class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # The ability rules further down in a file will override a previous one
    # User-owned resources
    can :manage, [Post, Comment] do |resource|
      user == resource.user
    end


  end
end
