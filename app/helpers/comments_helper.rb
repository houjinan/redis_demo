module CommentsHelper
  def fetch_comments
    comments =  $redis.get("comments")
    if comments.nil?
      comments = Comment.all.to_json
      $redis.set("comments", comments)
    end
    @comments = JSON.load comments
  end
end
