require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:session_token)}
  it {should validate_presence_of(:password_digest)}

  # it {should validate_uniqueness_of(:username)}
  # it {should validate_uniqueness_of(:session_token)}

  it{should have_many(:goals)}

  describe "uniqueness" do
    before :each do   #but we didnt call factory
        create(:user)
    end
    it {should validate_uniqueness_of(:username)}
    it {should validate_uniqueness_of(:session_token)
  end





end
