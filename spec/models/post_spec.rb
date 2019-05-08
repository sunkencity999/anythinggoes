require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:post) { Post.create!(title: "Test Post Title", body: "Test Post Body")}

  describe "attributes" do
    it "has title and body attributes" do
      expect(post).to have_attributes(title: "Test Post Title", body: "Test Post Body")
    end
  end
end
