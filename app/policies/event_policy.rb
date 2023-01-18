class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    user.present?
  end

  def edit?
    user_is_owner?(record)
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  private

  def user_is_owner?(event)
    user.present? && (event.user == user)
  end
end
