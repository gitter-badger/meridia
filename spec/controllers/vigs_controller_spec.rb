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

describe VigsController do

  # This should return the minimal set of attributes required to create a valid
  # Vig. As you add validations to Vig, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VigsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all vigs as @vigs" do
      vig = Vig.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vigs).should eq([vig])
    end
  end

  describe "GET show" do
    it "assigns the requested vig as @vig" do
      vig = Vig.create! valid_attributes
      get :show, {:id => vig.to_param}, valid_session
      assigns(:vig).should eq(vig)
    end
  end

  describe "GET new" do
    it "assigns a new vig as @vig" do
      get :new, {}, valid_session
      assigns(:vig).should be_a_new(Vig)
    end
  end

  describe "GET edit" do
    it "assigns the requested vig as @vig" do
      vig = Vig.create! valid_attributes
      get :edit, {:id => vig.to_param}, valid_session
      assigns(:vig).should eq(vig)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vig" do
        expect {
          post :create, {:vig => valid_attributes}, valid_session
        }.to change(Vig, :count).by(1)
      end

      it "assigns a newly created vig as @vig" do
        post :create, {:vig => valid_attributes}, valid_session
        assigns(:vig).should be_a(Vig)
        assigns(:vig).should be_persisted
      end

      it "redirects to the created vig" do
        post :create, {:vig => valid_attributes}, valid_session
        response.should redirect_to(Vig.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vig as @vig" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vig.any_instance.stub(:save).and_return(false)
        post :create, {:vig => { "name" => "invalid value" }}, valid_session
        assigns(:vig).should be_a_new(Vig)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vig.any_instance.stub(:save).and_return(false)
        post :create, {:vig => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vig" do
        vig = Vig.create! valid_attributes
        # Assuming there are no other vigs in the database, this
        # specifies that the Vig created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Vig.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => vig.to_param, :vig => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested vig as @vig" do
        vig = Vig.create! valid_attributes
        put :update, {:id => vig.to_param, :vig => valid_attributes}, valid_session
        assigns(:vig).should eq(vig)
      end

      it "redirects to the vig" do
        vig = Vig.create! valid_attributes
        put :update, {:id => vig.to_param, :vig => valid_attributes}, valid_session
        response.should redirect_to(vig)
      end
    end

    describe "with invalid params" do
      it "assigns the vig as @vig" do
        vig = Vig.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vig.any_instance.stub(:save).and_return(false)
        put :update, {:id => vig.to_param, :vig => { "name" => "invalid value" }}, valid_session
        assigns(:vig).should eq(vig)
      end

      it "re-renders the 'edit' template" do
        vig = Vig.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vig.any_instance.stub(:save).and_return(false)
        put :update, {:id => vig.to_param, :vig => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vig" do
      vig = Vig.create! valid_attributes
      expect {
        delete :destroy, {:id => vig.to_param}, valid_session
      }.to change(Vig, :count).by(-1)
    end

    it "redirects to the vigs list" do
      vig = Vig.create! valid_attributes
      delete :destroy, {:id => vig.to_param}, valid_session
      response.should redirect_to(vigs_url)
    end
  end

end
