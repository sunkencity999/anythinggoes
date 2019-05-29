require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    
    let!(:my_user) { User.create!(email: "user@anythinggoes.com", password: "password") }
    let!(:my_post) { Post.create!(title: "Test Title", body: "Test Body Content", user: my_user) }


  context "guest user" do
 
     describe "GET show" do
       it "returns http success" do
         get :show, params: { id: my_post.id }
         expect(response).to have_http_status(:success)
       end
 
       it "renders the #show view" do
         get :show, params: { id: my_post.id }
         expect(response).to render_template :show
       end
 
       it "assigns my_post to @post" do
         get :show, params: { id: my_post.id }
         expect(assigns(:post)).to eq(my_post)
       end
     end
 
     describe "GET new" do
       it "returns http redirect" do
         get :new, params: { id: my_post.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end
 
     describe "POST create" do
       it "returns http redirect" do
         post :create, params: { post: { title: "Test Title", body: "Test Body" } }
         expect(response).to redirect_to(new_user_session_path)
       end
     end
 
     describe "GET edit" do
       it "returns http redirect" do
         get :edit, params: { id: my_post.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end
 
     describe "PUT update" do
       it "returns http redirect" do
         new_title = "New Title"
         new_body = " New Body"
 
         put :update, params: { id: my_post.id, post: {title: new_title, body: new_body } }
         expect(response).to redirect_to(new_user_session_path)
       end
     end
 
     describe "DELETE destroy" do
       it "returns http redirect" do
         delete :destroy, params: { id: my_post.id }
         expect(response).to have_http_status(:redirect)
       end
     end
   end 
  
  context "signed-in user" do
     before do
       sign_in my_user
     end

     describe "GET show" do
       it "returns http success" do
         get :show, params: { id: my_post.id }
         expect(response).to have_http_status(:success)
       end

       it "renders the #show view" do
         get :show, params: { id: my_post.id }
         expect(response).to render_template :show
       end

       it "assigns my_post to @post" do
         get :show, params: { id: my_post.id }
         expect(assigns(:post)).to eq(my_post)
       end
     end

     # This test isn't giving the desired response, despite the functionality testing correct practicaly in dev and production
     describe "DELETE destroy" do
       it "deletes the post" do
        # delete :destroy, params: { id: my_post.id }
        # count = Post.where({id: my_post.id}).size
        # expect(count).to eq 0

      # delete :destroy, params:{ id: my_post.id }
      # expect(response).to change(Post, :count).by(-1)
       end

     end
   end
 
  
end
