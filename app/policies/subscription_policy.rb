class SubscriptionPolicy < ApplicationPolicy

  def create?
    !(user.present? && (record.event.user == user))
  end

  def destroy?
    can_user_destroy?
  end
end
