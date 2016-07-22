class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new 
      if user.admin?
        can :manage, :all
      else
        can :read, :all
        can :create, Order
        can [:destroy, :edit], Order do |object|
          object.user_id == user.id
        end
        
        can :create, Bid if user.transports.any?
        can [:destroy, :edit], Bid do |cargo|
          cargo.user_id == user.id
        end
        
        can :create, Transport
        can [:destroy, :edit], Transport do |car|
          car.user_id == user.id
        end
      end
  end
end
