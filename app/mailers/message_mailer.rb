class MessageMailer < ApplicationMailer
  def send_email(email:, subject:, body:)
    @body = body

    mail to: email, subject: subject
  end

  def new_photo(email:, event:, photo:)
    @event = event
    @name = photo.user.name
    @url = root_url.chop + photo.photo.url

    mail to: email, subject: "Новое фото в #{@event.title}"
  end
end
