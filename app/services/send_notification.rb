class SendNotification
  def comments comment
    comment_users(comment).map{|user_id| send_comment_notification(user_id, comment)}
  end
  
  def comment_users comment
    post_author = comment.post.author_id
    comment_author = comment.parent&.commentor_id
    puts '---------------------------------------'
    puts '---------------------------------------'
    puts post_author
    puts '---------------------------------------'
    puts '---------------------------------------'
    puts comment_author
    puts '---------------------------------------'
    puts '---------------------------------------'
    [post_author, comment_author].compact.uniq - [comment.commentor_id]
  end

  def send_comment_notification user_id, comment
    msg = "#{comment.commentor.email} have posted a comment in #{comment.post.group.name}"
    ActionCable.server.broadcast("notification_channel_#{user_id}", msg)
  end
end