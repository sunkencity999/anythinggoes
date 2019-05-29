require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

let(:my_user) { User.create!( email: "user@anythinggoes.com", password: "helloworld") }
let(:other_user) { User.create!( email: "otheruser@anythinggoes.com", password: "helloworld", role: :member) }
let(:my_post) { Post.create!(title: "Test Title", body: "Test Body", user: my_user) }
let(:my_comment) { Comment.create!(body: 'Comment Body', post: my_post, user: my_user) }

context "guest" do
     describe "POST create" do
       it "redirects the user to the sign in view" do
         post :create, params: { post_id: my_post.id, comment: { body: "This is test body content." } }
         expect(response).to redirect_to(new_user_session_path)
       end
     end
 
     describe "DELETE destroy" do
       it "redirects the user to the sign in view" do
         delete :destroy, params: { post_id: my_post.id, id: my_comment.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end
   end
 
   context "member user doing CRUD on a comment they don't own" do
     before do
       sign_in other_user
     end
 
     describe "POST create" do
       it "increases the number of comments by 1" do
         expect{ post :create, params: { post_id: my_post.id, comment: {body:"This is test body content."} } }.to change(Comment,:count).by(1)
       end
 
       it "redirects to the post show view" do
         post :create, params: { post_id: my_post.id, comment: {body:"This is test body content."} }
         expect(response).to redirect_to [my_post]
       end
     end
 
     describe "DELETE destroy" do
       it "redirects the user to the posts show view" do
         delete :destroy, params: { post_id: my_post.id, id: my_comment.id }
         expect(response).to redirect_to([my_post])
       end
     end
   end
 
 
   context "member user doing CRUD on a comment they own" do
     before do
       sign_in my_user
     end
 
     describe "POST create" do
       it "increases the number of comments by 1" do
         expect{ post :create, params: { post_id: my_post.id, comment: {body:"This is test body content."} } }.to change(Comment,:count).by(1)
       end
 
       it "redirects to the post show view" do
         post :create, params: { post_id: my_post.id, comment: {body:"This is test body content."} }
         expect(response).to redirect_to [my_post]
       end
     end
 
     describe "DELETE destroy" do
       it "deletes the comment" do
         delete :destroy, params: { post_id: my_post.id, id: my_comment.id }
         count = Comment.where({id: my_comment.id}).count
         expect(count).to eq 0
       end
 
       it "redirects to the post show view" do
         delete :destroy, params: { post_id: my_post.id, id: my_comment.id }
         expect(response).to redirect_to [my_post]
       end
     end
   end
 
   context "admin user doing CRUD on a comment they don't own" do
     before do
       other_user.admin!
       sign_in other_user
     end
 
     describe "POST create" do
       it "increases the number of comments by 1" do
         expect{ post :create, params: { post_id: my_post.id, comment: {body:"This is test body content."} } }.to change(Comment,:count).by(1)
       end
 
       it "redirects to the post show view" do
         post :create, params: { post_id: my_post.id, comment: {body:"This is test body content."} }
         expect(response).to redirect_to [my_post]
       end
     end
 
     describe "DELETE destroy" do
       it "deletes the comment" do
         delete :destroy, params: { post_id: my_post.id, id: my_comment.id }
         count = Comment.where({id: my_comment.id}).count
         expect(count).to eq 0
       end
 
       it "redirects to the post show view" do
         delete :destroy, params: { post_id: my_post.id, id: my_comment.id }
         expect(response).to redirect_to [my_post]
       end
     end
   end
end

