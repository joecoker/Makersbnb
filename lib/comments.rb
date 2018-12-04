class Comment
  attr_reader :id, :userid, :spaceid, :comment_text

  def initialize(id, userid, spaceid, comment_text)
    @id = id
    @userid = userid
    @spaceid = spaceid
    @comment_text = comment_text
  end

  def self.create(userid, spaceid, comment_text)
    result = DatabaseConnection.query(
      "INSERT INTO comments (commenter, space, comment_text)
      VALUES (#{userid}, #{spaceid}, '#{comment_text}')
      RETURNING id, commenter, space, comment_text;"
    )
    Comment.new(
      result[0]['id'],
      result[0]['userid'],
      result[0]['spaceid'],
      result[0]['comment_text']
    )
  end

  def self.show_comments_by_space(spaceid)
    result = DatabaseConnection.query(
      "SELECT comments.comment_text, users.username FROM comments
      INNER JOIN users
      ON comments.commenter = users.id
      WHERE comments.space = #{spaceid};"
    )
    result.map do |comment|
      {comment_text: comment['comment_text'], username: comment['username']}
    end
  end

end
