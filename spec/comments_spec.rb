describe 'User can request a booking after viewing a space' do
  describe '.create' do
    it 'allows a user to enter comments' do
      comment = Comment.create(1, 1, "Beautiful garden")
      expect(comment.comment_text).to eq("Beautiful garden")
    end
  end

  describe '.show_comments' do
    it 'shows a list of comments for a space' do
      comment = Comment.create(1, 1, "Bad garden")
      comment_list = Comment.show_comments_by_space(1)
      expect(comment.comment_text).to eq(comment_list[0][:comment_text])
    end
  end
end
