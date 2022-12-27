class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  with_options if: -> { user.present? } do
    validates :user, uniqueness: {scope: :event_id}
    validate :user_email_busy_by_creator
  end

  with_options unless: -> { user.present? } do
    validates :user_name, presence: true
    validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
    validates :user_email, uniqueness: {scope: :event_id}
    validate :user_email_busy
  end

  def user_name
    user&.name || super
  end

  def user_email
    user&.email || super
  end

  private

  def user_email_busy_by_creator
    errors.add(:user_email, :email_already_in_base) if user == event.user
  end

  def user_email_busy
    errors.add(:user_email, :email_already_in_use) if User.find_by(email: user_email).present?
  end
end
