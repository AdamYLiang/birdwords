require 'rails_helper'

RSpec.describe ChirpsController, type: :controller do
  describe 'GET#index' do
    it 'should render chirps index' do
      get :index # sending a get request to index method.
      expect(response).to render_template(:index)
    end
  end

  describe 'GET#new' do
    it 'should render chirps new' do
      # subject is the ChirpsController
      allow(subject).to receive(:logged_in?).and_return(true)
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'DELETE#destroy' do
    let!(:chirp) { create(:chirp) }

    before :each do
      allow(subject).to receive(:current_user).and_return(chirp.author)
      delete :destroy, params: { id: chirp.id }
    end
    
    it 'should delete the chirp' do
      expect(Chirp.exists?(chirp.id)).to be(false)
    end

    it 'should redirect us to chirp #index' do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(chirps_url)
    end

  end

  describe 'POST#create' do
    before :each do
      create(:user)
      # subject is the controller
      allow(subject).to receive(:current_user).and_return(User.last)
    end

    let(:valid_chirp) {{ chirp: { body: 'my wife' } }}
    let(:invalid_chirp) {{ chirp: { nothing: '' } }}

    context 'with valid chirp' do
      it 'creates the chirp' do
        post :create, params: valid_chirp
        expect(Chirp.last.body).to eq('my wife')
      end

      it 'redirects us to chirp #show' do
        post :create, params: valid_chirp
        expect(response).to redirect_to(chirp_url(Chirp.last.id))
      end
    end

    context 'with invalid chirp' do
      before :each do
        post :create, params: invalid_chirp
      end

      it 'redirects to the chirps_url' do
        expect(response).to have_http_status(422)
        expect(response).to render_template(:new)
      end

      it 'adds errors to flash' do
        expect(flash[:errors]).to be_present
      end
    end
  end
end
