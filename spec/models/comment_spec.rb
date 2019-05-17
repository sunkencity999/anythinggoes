require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:user) { User.create!(email: "user@anythinggoes.com", password: "password") }
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body", user: user) }
    let(:comment) { Comment.create!(body: 'Comment Body', post: post) }
 
   describe "attributes" do
     it "has a body attribute" do
       expect(comment).to have_attributes(body: "Comment Body")
     end
   end

end
