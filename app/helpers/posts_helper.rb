module PostsHelper
  def post_time(post)
    if post.created_at
      "#{post.created_at.to_date} | #{time_ago_in_words(post.created_at, include_seconds: true)} ago"
    elsif post.updated_at
      post.updated_at.to_date
    end
  end
end
