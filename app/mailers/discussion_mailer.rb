class DiscussionMailer < ActionMailer::Base
  include ApplicationHelper
  default :from => "\"Loomio\" <noreply@loomio.org>", :css => :email

  def new_discussion_created(discussion, user)
    @user = user
    @discussion = discussion
    @group = discussion.group
    @rendered_discussion_description = render_rich_text(discussion.description, discussion.uses_markdown)
    mail(
      to: user.email,
      reply_to: discussion.author_email,
      subject: "#{email_subject_prefix(@group.full_name)} New discussion - #{@discussion.title}")
  end
end
