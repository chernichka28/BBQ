class MessageMailer < ApplicationMailer
  def new_photo(email:, photo:)
    @event = photo.event
    @name = photo.user.name
    @photo_url = root_url.chop + photo.photo.url
    @url = root_url

    mail to: email, subject: "#{I18n.t("message_mailer.new_photo.subject")}#{@event.title}"
  end

  def new_comment(comment:, email:)
    @comment = comment
    @event = comment.event

    mail to: email, subject: "#{I18n.t("message_mailer.new_comment.subject")}#{@event.title}"
  end
end
