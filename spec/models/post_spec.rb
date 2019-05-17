require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user) { User.create!(email: "user@anythinggoes.com", password: "password") }
  let(:post) { Post.create!(title: "Test Post Title", body: "Test Post Body", user: user)}

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
   
 
  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(5) }
  it { is_expected.to validate_presence_of(:user) }

  describe "attributes" do
    it "has title and body, and user attributes" do
      expect(post).to have_attributes(title: "Test Post Title", body: "Test Post Body", user: user)
    end
  end
end
