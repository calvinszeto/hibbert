require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	before(:each) do
	end

  describe "GET index" do
		it "returns a user object for the currently-signed-in user" do
      #user = User.create! valid_attributes
      #get :index, {}, valid_session
      #expect(assigns(:users)).to eq([user])
		end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        #expect {
          #post :create, {:user => valid_attributes}, valid_session
        #}.to change(User, :count).by(1)
      end

			it "creates a new session for the user" do
			end
    end

    describe "with invalid params" do
			it "responds with an error" do
			end
    end
  end

  describe "PATCH update" do
    describe "with valid params" do
      it "updates the requested user" do
        #user = User.create! valid_attributes
        #put :update, {:id => user.to_param, :user => new_attributes}, valid_session
        #user.reload
        #skip("Add assertions for updated state")
      end
    end

    describe "with invalid params" do
			it "responds with an error" do
			end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      #user = User.create! valid_attributes
      #expect {
        #delete :destroy, {:id => user.to_param}, valid_session
      #}.to change(User, :count).by(-1)
    end

		it "destroys the current session" do
		end
  end

end
