require 'rails_helper'

RSpec.describe UserController, type: :controller do

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





end