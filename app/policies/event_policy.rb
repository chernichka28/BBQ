class EventPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
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
