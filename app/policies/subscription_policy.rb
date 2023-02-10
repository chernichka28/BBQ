class SubscriptionPolicy < ApplicationPolicy

  def destroy?
    can_user_destroy?
  end
end
