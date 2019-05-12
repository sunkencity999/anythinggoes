require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:post) { Post.create!(title: "Test Post Title", body: "Test Post Body")}

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
   
 
  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(5) }


  describe "attributes" do
    it "has title and body attributes" do
      expect(post).to have_attributes(title: "Test Post Title", body: "Test Post Body")
    end
  end
end
