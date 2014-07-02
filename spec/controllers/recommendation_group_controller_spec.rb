require 'rails_helper'

RSpec.describe RecommendationGroupController, :type => :controller do
  describe "GET index" do
    it "assigns all sources as @sources" do
      source = Source.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:sources)).to eq([source])
    end
  end

  describe "GET show" do
    it "assigns the requested source as @source" do
      source = Source.create! valid_attributes
      get :show, {:id => source.to_param}, valid_session
      expect(assigns(:source)).to eq(source)
    end
  end

  describe "GET new" do
    it "assigns a new source as @source" do
      get :new, {}, valid_session
      expect(assigns(:source)).to be_a_new(Source)
    end
  end

  describe "GET edit" do
    it "assigns the requested source as @source" do
      source = Source.create! valid_attributes
      get :edit, {:id => source.to_param}, valid_session
      expect(assigns(:source)).to eq(source)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Source" do
        expect {
          post :create, {:source => valid_attributes}, valid_session
        }.to change(Source, :count).by(1)
      end

      it "assigns a newly created source as @source" do
        post :create, {:source => valid_attributes}, valid_session
        expect(assigns(:source)).to be_a(Source)
        expect(assigns(:source)).to be_persisted
      end

      it "redirects to the created source" do
        post :create, {:source => valid_attributes}, valid_session
        expect(response).to redirect_to(Source.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved source as @source" do
        post :create, {:source => invalid_attributes}, valid_session
        expect(assigns(:source)).to be_a_new(Source)
      end

      it "re-renders the 'new' template" do
        post :create, {:source => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested source" do
        source = Source.create! valid_attributes
        put :update, {:id => source.to_param, :source => new_attributes}, valid_session
        source.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested source as @source" do
        source = Source.create! valid_attributes
        put :update, {:id => source.to_param, :source => valid_attributes}, valid_session
        expect(assigns(:source)).to eq(source)
      end

      it "redirects to the source" do
        source = Source.create! valid_attributes
        put :update, {:id => source.to_param, :source => valid_attributes}, valid_session
        expect(response).to redirect_to(source)
      end
    end

    describe "with invalid params" do
      it "assigns the source as @source" do
        source = Source.create! valid_attributes
        put :update, {:id => source.to_param, :source => invalid_attributes}, valid_session
        expect(assigns(:source)).to eq(source)
      end

      it "re-renders the 'edit' template" do
        source = Source.create! valid_attributes
        put :update, {:id => source.to_param, :source => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested source" do
      source = Source.create! valid_attributes
      expect {
        delete :destroy, {:id => source.to_param}, valid_session
      }.to change(Source, :count).by(-1)
    end

    it "redirects to the sources list" do
      source = Source.create! valid_attributes
      delete :destroy, {:id => source.to_param}, valid_session
      expect(response).to redirect_to(sources_url)
    end
  end

end
