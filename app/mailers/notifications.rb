class Notifications < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.post_comment.subject
  #
  def notify_owner_of_comment(comment)
    @comment = comment
    @post = @comment.post
    @author = @post.user

    mail to: @author.email, subject: "New comment on '#{@post.title}'"
  end
end
