class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user && user.admin_flg?
      can :access, :rails_admin
      can :manage, :all
    else
      can [:index, :show], [User, Frame]
      cannot [:new, :create, :edit, :update, :destroy], Frame
    end
  end
end
