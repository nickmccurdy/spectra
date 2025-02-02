require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TracksController, type: :controller do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TracksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
    @track = create(:track)
  end

  describe 'GET index' do
    it 'assigns all tracks as @tracks' do
      get :index, {}, valid_session
      expect(assigns(:tracks)).to eq([@track])
    end
  end

  describe 'GET show' do
    it 'assigns the requested track as @track' do
      get :show, {id: @track.to_param}, valid_session
      expect(assigns(:track)).to eq(@track)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Track' do
        expect {
          post(:create, {track: attributes_for(:track,
                                               title: 'Tokyo Skies',
                                               track_id: 2,
                                               location: '/mnt/Data/Music/Chipzel/Spectra/Tokyo Skies.flac'),
                                album: @track.album.title,
                                artist: @track.artist.name, format: :json },
               valid_session)
        }.to change(Track, :count).by(1)
      end

      it 'assigns a newly created track as @track' do
        post(:create, {track: attributes_for(:track,
                                             title: 'Forged in Stars',
                                             track_id: 3,
                                             location: '/mnt/Data/Music/Chipzel/Spectra/Forged in Stars.flac'),
                      album: @track.album.title,
                      artist: @track.artist.name, format: :json}, valid_session)
        expect(assigns(:track)).to be_a(Track)
        expect(assigns(:track)).to be_persisted
      end

      it 'redirects to the created track' do
        post(:create, {track: attributes_for(:track,
                                             title: 'Formed in the Clouds',
                                             track_id: 4,
                                             location: '/mnt/Data/Music/Chipzel/Spectra/Formed in the Clouds.flac'),
                              album: @track.album.title,
                      artist: @track.artist.name, format: :json},
             valid_session)
        track = Track.last
        expect(response).to have_http_status(:created)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved track as @track' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Track).to receive(:save).and_return(false)
        post :create, { track: {'title' => ''}, format: :json}, valid_session
        expect(assigns(:track)).to be_a_new(Track)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Track).to receive(:save).and_return(false)
        post :create, {track: {'title' => ''}, format: :json}, valid_session
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested track' do
        # Assuming there are no other tracks in the database, this
        # specifies that the Track created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Track).to receive(:update).with({'title' => 'Only Human', 'track_id' => '5'})
        put :update, {id: @track.to_param,
                      track: {'title' => 'Only Human', 'track_id' => '5'}, format: :json}, valid_session
      end

      it 'assigns the requested track as @track' do
        put :update, {id: @track.to_param,
                      track: attributes_for(:track), format: :json}, valid_session
        expect(assigns(:track)).to eq(@track)
      end

      it 'redirects to the track' do
        put :update, {id: @track.to_param,
                      track: attributes_for(:track), format: :json}, valid_session
        expect(response).to be_ok
      end
    end

    describe 'with invalid params' do
      it 'assigns the track as @track' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Track).to receive(:update).and_return(false)
        put :update, {id: @track.to_param,
                      track: {'title' => 'invalid value'}, format: :json}, valid_session
        expect(assigns(:track)).to eq(@track)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Track).to receive(:update).and_return(false)
        put :update, {id: @track.to_param,
                      track: {'title' => 'invalid value'}, format: :json}, valid_session
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested track' do
      expect {
        delete :destroy, {id: @track.to_param, format: :json}, valid_session
      }.to change(Track, :count).by(-1)
    end

  end

end
