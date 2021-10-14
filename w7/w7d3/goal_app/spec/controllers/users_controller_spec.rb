require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject (:jasmine) { User.create!(username: 'jasmine', password: 'abcdef') }

  describe 'GET #new' do
    it 'renders the new users template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do 
    context 'with valid parameters' do
      it 'redirects user to index page' do
        post :create, params: {user: { username: 'paulo', password: 'password'}}
        expect(response).to redirect_to(users_url) 
      end

      it 'logs in the user' do
        post :create, params: {user: { username: 'paulo', password: 'password'}}
        user = User.find_by_username('paulo')

        expect(session[:session_token]).to eq(user.session_token)
      end
    end

    context 'with invalid parameters' do 

      it 'validates the presence of email password' do
        post :create, params: {user: { username: 'paulo', password: ''}}
        expect(response).to render_template('new')
        expect(flash[:errors]).to eq(['Password cannot be blank'])
      end

      it 'validates that the password is at least 6 characters long' do
        post :create, params: {user: { username: 'paulo', password: 'happy'}}
        expect(response).to render_template('new')
        expect(flash[:errors]).to eq(['Password is too short, minimum is 6 characters.'])
      end
    end
  end

  describe "GET #show" do
    context "when logged in" do
      before do 
        allow(controller).to receive(:current_user) {jasmine}
      end

      it "renders thw show page of the specified user" do
        get :show, params: {id: jasmine.id}
        fetched_user = controller.instance_variable_get(:@user)
        expect(fetched_user).to eq(User.find(jasmine.id))
        expect(response).to render_template(:show)
      end
    end

    context "when logged out" do
      before do 
        allow(controller).to receive(:current_user) {nil}
      end

      it "directs to the login page" do 
        get :show, params: {id: jasmine.id}
        expect(response).to redirect_to(new_sesion_url)
      end
    end
  end

  describe 'GET #index' do
    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { jasmine }
      end

      it 'renders the index page of all the users' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
        get :index
        expect(response).to redirect_to(new_session_url)
      end
    end
  end      
end