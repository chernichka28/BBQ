class CommentPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def destroy?
    can_user_destroy?
  end
end
