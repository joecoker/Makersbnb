class Comment
  attr_reader :id, :userid, :spaceid, :comment_text

  def initialize(id:, userid:, spaceid:, comment_text:)
    @id = id
    @userid = userid
    @spaceid = spaceid
    @comment_text = comment_text
  end

  def self.create(userid:, spaceid:, comment_text:)
    result = DatabaseConnection.query(
      "INSERT INTO comments (commenter, space, commenttext)
      VALUES (#{userid}, #{spaceid}, '#{comment_text}')
      RETURNING id, commenter, space, commenttext;"
    )
    Comment.new(
      id: result[0]['id'],
      userid: result[0]['commenter'],
      spaceid: result[0]['space'],
      comment_text: result[0]['commenttext']
    )
  end

  def self.show_comments_by_space(spaceid:)
    result = DatabaseConnection.query(
      "SELECT comments.commenttext, users.username FROM comments
      INNER JOIN users
      ON comments.commenter = users.id
      WHERE comments.space = #{spaceid};"
    )
    result.map do |comment|
      { comment_text: comment['commenttext'], username: comment['username'] }
    end
  end

end
