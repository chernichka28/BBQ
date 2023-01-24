class CommentNotifySubscribersJob < ApplicationJob
  queue_as :default

  def perform(comment)
    all_emails = (comment.event.subscriptions.map(&:user_email) + [comment.event.user.email] - [comment.user&.email]).uniq

    all_emails.each do |email|
      MessageMailer.new_comment(comment: comment, email: email).deliver_later
    end
  end
end
