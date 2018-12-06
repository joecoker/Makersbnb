describe 'User can request a booking after viewing a space' do
  describe '.create' do
    it 'allows a user to enter comments' do
      comment = Comment.create(
        userid: SECOND_DEFAULT_USER[:id],
        spaceid: DEFAULT_SPACE[:id],
        comment_text: "Beautiful garden")
      expect(comment.comment_text).to eq("Beautiful garden")
    end
  end

  describe '.show_comments' do
    it 'shows a list of comments for a space' do
      comment = Comment.create(
        userid: SECOND_DEFAULT_USER[:id],
        spaceid: DEFAULT_SPACE[:id],
        comment_text: "Bad garden"
      )
      comment_list = Comment.show_comments_by_space(spaceid: DEFAULT_SPACE[:id])
      expect(comment.comment_text).to eq(comment_list[0][:comment_text])
    end
  end
end
