describe 'User can request a booking after viewing a space' do
  it 'allows a user to enter comments' do
    comment = Commment.create(1, 1, "Beautiful garden")
    expect(comment.comment_text).to eq("Beautiful garden")
  end
end
