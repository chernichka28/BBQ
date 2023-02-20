class CommentPolicy < ApplicationPolicy

  def create?
    true
  end

  def destroy?
    can_user_destroy?
  end
end
