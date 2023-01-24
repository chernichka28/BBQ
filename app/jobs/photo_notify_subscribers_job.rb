class PhotoNotifySubscribersJob < ApplicationJob
  queue_as :default

  def perform(photo)
    all_emails = (photo.event.subscriptions.map(&:user_email) + [photo.event.user.email] - [photo.user&.email]).uniq

    all_emails.each do |email|
      MessageMailer.new_photo(email: email, photo: photo).deliver_later
    end
  end
end
