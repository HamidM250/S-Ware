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

describe OrientationsController do

  # This should return the minimal set of attributes required to create a valid
  # Orientation. As you add validations to Orientation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "presenter" => "Matt" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrientationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all orientations as @orientations" do
      orientation = Orientation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:orientations).should eq([orientation])
    end
  end

  describe "GET show" do
    it "assigns the requested orientation as @orientation" do
      orientation = Orientation.create! valid_attributes
      get :show, {:id => orientation.to_param}, valid_session
      assigns(:orientation).should eq(orientation)
    end
  end

  describe "GET new" do
    it "assigns a new orientation as @orientation" do
      get :new, {}, valid_session
      assigns(:orientation).should be_a_new(Orientation)
    end
  end

  describe "GET edit" do
    it "assigns the requested orientation as @orientation" do
      orientation = Orientation.create! valid_attributes
      get :edit, {:id => orientation.to_param}, valid_session
      assigns(:orientation).should eq(orientation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Orientation" do
        expect {
          post :create, {:orientation => valid_attributes}, valid_session
        }.to change(Orientation, :count).by(1)
      end

      it "assigns a newly created orientation as @orientation" do
        post :create, {:orientation => valid_attributes}, valid_session
        assigns(:orientation).should be_a(Orientation)
        assigns(:orientation).should be_persisted
      end

      it "redirects to the created orientation" do
        post :create, {:orientation => valid_attributes}, valid_session
        response.should redirect_to(Orientation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved orientation as @orientation" do
        # Trigger the behavior that occurs when invalid params are submitted
        Orientation.any_instance.stub(:save).and_return(false)
        post :create, {:orientation => { "presenter" => "invalid value" }}, valid_session
        assigns(:orientation).should be_a_new(Orientation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Orientation.any_instance.stub(:save).and_return(false)
        post :create, {:orientation => { "presenter" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

#  let(:update_attributes) => { { "participantMax" => "4" } }
  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested orientation" do
        orientation = Orientation.create! valid_attributes
        # Assuming there are no other orientations in the database, this
        # specifies that the Orientation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.

        Orientation.any_instance.should_receive(:update_attributes).with({ "presenter" => "MyString" })
        put :update, {:id => orientation.to_param, :orientation => { "presenter" => "MyString" }}, valid_session
      end

      it "assigns the requested orientation as @orientation" do
        orientation = Orientation.create! valid_attributes
        put :update, {:id => orientation.to_param, :orientation => valid_attributes}, valid_session
        assigns(:orientation).should eq(orientation)
      end

      it "redirects to the orientation" do
        orientation = Orientation.create! valid_attributes
        put :update, {:id => orientation.to_param, :orientation => valid_attributes}, valid_session
        response.should redirect_to(orientation)
      end
    end

    describe "with invalid params" do
      it "assigns the orientation as @orientation" do
        orientation = Orientation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Orientation.any_instance.stub(:save).and_return(false)
        put :update, {:id => orientation.to_param, :orientation => { "presenter" => "invalid value" }}, valid_session
        assigns(:orientation).should eq(orientation)
      end

      it "re-renders the 'edit' template" do
        orientation = Orientation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Orientation.any_instance.stub(:save).and_return(false)
        put :update, {:id => orientation.to_param, :orientation => { "presenter" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested orientation" do
      orientation = Orientation.create! valid_attributes
      expect {
        delete :destroy, {:id => orientation.to_param}, valid_session
      }.to change(Orientation, :count).by(-1)
    end

    it "redirects to the orientations list" do
      orientation = Orientation.create! valid_attributes
      delete :destroy, {:id => orientation.to_param}, valid_session
      response.should redirect_to(orientations_url)
    end
  end

end
