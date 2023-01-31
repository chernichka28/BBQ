class SubscriptionPolicy < ApplicationPolicy

  def destroy?
    user.present? && (
      record.user == current_user ||
      (record.try(:event).present? && record.event.user == current_user)
    )
  end
end
