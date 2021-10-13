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

  # describe "is_valid_password?" do
  #   let!(:user) {create(users)} #create bot
  #       context "with a valid password" do 
  #           it "should return true" do
  #               expect(user.is_valid_password?('password')).to be true
  #           end
  #       end

  #       context "with an invalid password" do 
  #           it "should return false" do
  #               expect(user.is_valid_password?('pineapple')).to be false
  #           end
  #       end   
  # end
  describe 'password encryption' do
    it 'does not save passwords to the database' do
      User.create!(username: 'sunny_d', password: 'password')
      sunny = User.find_by(username: 'sunny_d')
      expect(sunny.password).not_to be('password')
    end
    context 'it saves passwords properly' do 
      it 'encrypts the password using BCrypt' do
        expect(BCrypt::Password).to receive(:create)
        User.new(username: 'jack_bruce', password: 'abcdef')
      end

      it 'properly sets the password reader' do
        user = User.new(username: 'jack_bruce', password: 'abcdef')
        expect(user.password).to eq('abcdef')
      end
    end
  end

  # let!(:user) {create(users)}]
  subject {  User.create!(username: 'lilly_llama', password: 'password')}

  describe "session_token" do  
    it "set the new session_token on the user" do
        subject.valid?
        old_session_token = subject.session_token
        subject.reset_session_token!
        expect(subject.session_token).not_to eq(old_session_token)
    end

    it "returns new session token" do
        expect(subject.reset_session_token!).to eq(subject.session_token)
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
