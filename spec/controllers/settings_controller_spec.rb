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

RSpec.describe SettingsController, type: :controller do
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TracksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all setting as @settings' do
      setting = create(:settings)
      get :index, {format: :json}, valid_session
      expect(assigns(:settings)).to eq(Settings.unscoped.get_all)
    end
  end

  describe 'GET show' do
    it 'assigns the requested artist as @setting' do
      setting = create(:settings)
      get :show, {var: setting.var, format: :json}, valid_session
      expect(assigns(:setting)).to eq(setting.value)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Setting' do
        expect {
          post(:create, {var:'uuid2', value:'4567'}, valid_session)
        }.to change(Settings, :count).by(1)
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested setting' do
        # Assuming there are no other tracks in the database, this
        # specifies that the Track created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        settings = create(:settings)
        put :update, {var: 'uuid', value: '8910', format: :json}, valid_session
        expect(Settings[:uuid]).to eql('8910')
      end
    end
  end
  describe 'DELETE destroy' do
    it 'destroys the requested setting' do
      settings = create(:settings, var:'uuid3', value:'abcd')
      expect {
        delete :destroy, {var:'uuid3'}, valid_session
      }.to change(Settings, :count).by(-1)
    end
  end
end
