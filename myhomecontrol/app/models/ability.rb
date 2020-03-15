class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?
    # can :manage, :all

    can :manage, Product do |product|
      product.try(:context) == user.context
     end

    can :manage, PurchaseList do |purchase_list|
      purchase_list.try(:context) == user.context
    end

  end
end
