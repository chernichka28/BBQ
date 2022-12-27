class MessageMailer < ApplicationMailer
  def new_photo(email:, event:, photo:)
    @event = event
    @name = photo.user.name
    @url = root_url.chop + photo.photo.url

    mail to: email, subject: "Новое фото в #{@event.title}"
  end

  def new_comment(event:, comment:, email:)
    @comment = comment
    @event = event

    mail to: email, subject: "Новый комментарий @ #{event.title}"
  end
end
