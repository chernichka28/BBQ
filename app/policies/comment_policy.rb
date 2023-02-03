class CommentPolicy < ApplicationPolicy

  def destroy?
    user.present? && (
      record.user == user ||
      (record.try(:event).present? && record.event.user == user)
    )
  end
end
