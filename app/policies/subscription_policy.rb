class SubscriptionPolicy < ApplicationPolicy

  def destroy?
    user.present? && (
      record.user == current_user ||
      (record.try(:event).present? && record.event.user == current_user)
    )
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
