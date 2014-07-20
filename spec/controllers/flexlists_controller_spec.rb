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

describe FlexlistsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Flexlist. As you add validations to Flexlist, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: "Hip and Happening", match: 'all_rules' }
  end

  let(:invalid_attributes) { {name: ''} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FlexlistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all flexlists as @flexlists" do
      flexlist = Flexlist.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:flexlists)).to eq([flexlist])
    end
  end

  describe "GET show" do
    it "assigns the requested flexlist as @flexlist" do
      flexlist = Flexlist.create! valid_attributes
      get :show, {:id => flexlist.to_param}, valid_session
      expect(assigns(:flexlist)).to eq(flexlist)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Flexlist" do
        expect {
          post :create, {:flexlist => valid_attributes}, valid_session
        }.to change(Flexlist, :count).by(1)
      end

      it "assigns a newly created flexlist as @flexlist" do
        post :create, {:flexlist => valid_attributes}, valid_session
        expect(assigns(:flexlist)).to be_a(Flexlist)
        expect(assigns(:flexlist)).to be_persisted
      end

      it "has status created" do
        post :create, {:flexlist => valid_attributes}, valid_session
        expect(response).to have_http_status(:created)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved flexlist as @flexlist" do
        post :create, {:flexlist => invalid_attributes}, valid_session
        expect(assigns(:flexlist)).to be_a_new(Flexlist)
      end

      it "is unprocessable" do
        post :create, {:flexlist => invalid_attributes}, valid_session
        expect(response).to be_unprocessable
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { name: "Super Current", match: 'any_rules' }
      }

      it "updates the requested flexlist" do
        flexlist = Flexlist.create! valid_attributes
        put :update, {:id => flexlist.to_param, :flexlist => new_attributes}, valid_session
        flexlist.reload
        expect(flexlist.name).to eq("Super Current")
      end

      it "assigns the requested flexlist as @flexlist" do
        flexlist = Flexlist.create! valid_attributes
        put :update, {:id => flexlist.to_param, :flexlist => valid_attributes}, valid_session
        expect(assigns(:flexlist)).to eq(flexlist)
      end

      it "has response ok" do
        flexlist = Flexlist.create! valid_attributes
        put :update, {:id => flexlist.to_param, :flexlist => valid_attributes}, valid_session
        expect(response).to be_ok
      end
    end

    describe "with invalid params" do
      it "assigns the flexlist as @flexlist" do
        flexlist = Flexlist.create! valid_attributes
        put :update, {:id => flexlist.to_param, :flexlist => invalid_attributes}, valid_session
        expect(assigns(:flexlist)).to eq(flexlist)
      end

      it "is unprocessable" do
        flexlist = Flexlist.create! valid_attributes
        put :update, {:id => flexlist.to_param, :flexlist => invalid_attributes}, valid_session
        expect(response).to be_unprocessable
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested flexlist" do
      flexlist = Flexlist.create! valid_attributes
      expect {
        delete :destroy, {:id => flexlist.to_param}, valid_session
      }.to change(Flexlist, :count).by(-1)
    end

    it "has http status no content" do
      flexlist = Flexlist.create! valid_attributes
      delete :destroy, {:id => flexlist.to_param}, valid_session
      expect(response).to have_http_status(:no_content)
    end
  end

end
