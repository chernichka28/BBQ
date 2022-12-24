class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }

  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  validates_each :user_email, unless: -> { user.present? } do |record, attr, value|
    record.errors.add(attr, "Пользователь с такой почтой существует!") if User.find_by(email: value).present?
  end

  before_save :check_email

  def user_name
    if user.present?
     user.name
    else
     super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def check_email
    self.destroy if user == event.user
  end

end
