require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.create!(email: "user@anythinggoes.com", password: "password") }

   it { is_expected.to have_many(:posts) }

   it { is_expected.to validate_presence_of(:email) } 

end
