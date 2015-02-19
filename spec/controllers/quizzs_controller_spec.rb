require 'rails_helper'

RSpec.describe Admin::QuizzsController, :type => :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all quizzs as @quizzs" do
      quizz = Quizz.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:quizzs)).to eq([quizz])
    end
  end

  describe "GET show" do
    it "assigns the requested quizz as @quizz" do
      quizz = Quizz.create! valid_attributes
      get :show, {:id => quizz.to_param}, valid_session
      expect(assigns(:quizz)).to eq(quizz)
    end
  end

  # describe "GET new" do
  #   it "assigns a new quizz as @quizz" do
  #     xhr :get, :new, {}, valid_session
  #     expect(assigns(:quizz)).to be_a_new(Quizz)
  #   end
  # end

  describe "GET edit" do
    it "assigns the requested quizz as @quizz" do
      quizz = Quizz.create! valid_attributes
      get :edit, {:id => quizz.to_param}, valid_session
      expect(assigns(:quizz)).to eq(quizz)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Quizz" do
        expect {
          post :create, {:quizz => valid_attributes}, valid_session
        }.to change(Quizz, :count).by(1)
      end

      it "assigns a newly created quizz as @quizz" do
        post :create, {:quizz => valid_attributes}, valid_session
        expect(assigns(:quizz)).to be_a(Quizz)
        expect(assigns(:quizz)).to be_persisted
      end

      it "redirects to the created quizz" do
        post :create, {:quizz => valid_attributes}, valid_session
        expect(response).to redirect_to(Quizz.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved quizz as @quizz" do
        post :create, {:quizz => invalid_attributes}, valid_session
        expect(assigns(:quizz)).to be_a_new(Quizz)
      end

      it "re-renders the 'new' template" do
        post :create, {:quizz => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested quizz" do
        quizz = Quizz.create! valid_attributes
        put :update, {:id => quizz.to_param, :quizz => new_attributes}, valid_session
        quizz.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested quizz as @quizz" do
        quizz = Quizz.create! valid_attributes
        put :update, {:id => quizz.to_param, :quizz => valid_attributes}, valid_session
        expect(assigns(:quizz)).to eq(quizz)
      end

      it "redirects to the quizz" do
        quizz = Quizz.create! valid_attributes
        put :update, {:id => quizz.to_param, :quizz => valid_attributes}, valid_session
        expect(response).to redirect_to(quizz)
      end
    end

    describe "with invalid params" do
      it "assigns the quizz as @quizz" do
        quizz = Quizz.create! valid_attributes
        put :update, {:id => quizz.to_param, :quizz => invalid_attributes}, valid_session
        expect(assigns(:quizz)).to eq(quizz)
      end

      it "re-renders the 'edit' template" do
        quizz = Quizz.create! valid_attributes
        put :update, {:id => quizz.to_param, :quizz => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested quizz" do
      quizz = Quizz.create! valid_attributes
      expect {
        delete :destroy, {:id => quizz.to_param}, valid_session
      }.to change(Quizz, :count).by(-1)
    end

    it "redirects to the quizzs list" do
      quizz = Quizz.create! valid_attributes
      delete :destroy, {:id => quizz.to_param}, valid_session
      expect(response).to redirect_to(quizzs_url)
    end
  end

end
