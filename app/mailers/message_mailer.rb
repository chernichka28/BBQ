class MessageMailer < ApplicationMailer
  def new_photo(email:, photo:)
    @event = photo.event
    @name = photo.user.name
    @photo_url = root_url.chop + photo.photo.url
    @url = root_url

    mail to: email, subject: default_i18n_subject(title: @event.title)
  end

  def new_comment(comment:, email:)
    @comment = comment
    @event = comment.event

    mail to: email, subject: default_i18n_subject(title: @event.title)
  end
end
