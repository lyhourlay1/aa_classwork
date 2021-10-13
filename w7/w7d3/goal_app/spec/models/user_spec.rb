require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:session_token)}
  it {should validate_presence_of(:password_digest)}

  # it {should validate_uniqueness_of(:username)}
  # it {should validate_uniqueness_of(:session_token)}

  it {should have_many(:goals)}

  describe "uniqueness" do
    before :each do   #but we didnt call factory
        create(:user)
    end
    it {should validate_uniqueness_of(:username)}
    it {should validate_uniqueness_of(:session_token)}
  end

  describe "is_valid_password?" do
    let!(:user) {create(users)} #create bot
        context "with a valid password" do 
            it "should return true" do
                expect(user.is_valid_password?('password')).to be true
            end
        end

        context "with an invalid password" do 
            it "should return false" do
                expect(user.is_valid_password?('pineapple')).to be false
            end
        end   
  end

  # let!(:user) {create(users)}
  
  describe "reset_session_token" do  
    it "set the new session_token on the user" do
        user.valid?
        old_session_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).not_to eq(old_session_token)
    end

    it "returns new session token" do
        expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe 'self.find_by_credentials' do
    # sally = User.create(username: 'sally_lee', password: 'password')
    # user = User.find_by_credentials('sally_lee','password')
    it 'returns user given good credentials' do
      sally = User.create(username: 'sally_lee', password: 'password')
      user = User.find_by_credentials('sally_lee','password')
      expect(sally.username).to eq(user.username)
      expect(sally.password_digest).to eq(user.password_digest)
    end

    it 'return nil if bad credentials was given' do
      jack = User.create(username: 'jack_bruce', password: 'abcdef')
      user = User.find_by_credentials('jack_bruce','notthepassword')
      expect(user).to be_nil 
    end
  end





  



end
